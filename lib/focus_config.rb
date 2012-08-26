#encoding:utf-8
require 'focus_base'
#微博类的动态生成
module Focus
  class Modul
    #singleton_methods,使用类名直接调用
    class << self
      #生成Weibo::Config类
      #根据读取配置文件信息批量生产Config Module
      #每个Config类中包含成对的set、get,用于设置、读取配置信息
      #参数modules为需要生成Weibo::Config类的微博类名数组，通过读取配置yml文件取得
      def generate_config_module(modules)
        #每个Config类中的方法名，根据需要修改methods数组信息
        methods = %W[api_key api_secret redirect_uri site authorize_url token_url]
        modules.each do |mod|
          modul = Object.const_get(mod)
          methods.each do |meth|
            modul.module_eval <<-RUBY
              module Config
                class << self
                  attr_accessor :#{meth}
                end
              end
            RUBY
          end
        end
      end
      #使用generate_config_module生成的微博类
      #在启动rails时动态读取配置yml文件
      #读取配置文件信息，并自我赋值，为oauth2授权认证提供基本参数
      #如果rails启动时没有成功读取，只能手工赋值像Weibo::Config.site = "...."
      #参数modules为需要生成Weibo::Config类的微博类名数组
      #参数weibo_oauth为读取配置yml文件时的reader
      def read_oauth_config(modules,weibo_oauth)
        #数组methods与generate_config_module生成Weibo::Config中的set,get对应
        methods = %W[site authorize_url token_url api_key api_secret redirect_uri]
        modules.each do |k|
          #配置yml文件格式要正确，否则读取失败
          methods.each do |m|
            Object.const_get(k).send(:eval,%Q[#{k}::Config.#{m} = weibo_oauth["#{k}"]["development"]["#{m}"]])
          end
          puts "成功读取#{k}微博配置信息..."
        end
      end
      #生成Weibo::Client主类
      #参数modules为需要生成Weibo::Config类的微博类名数组
      def generate_weibo_client(modules)
        modules.each do |mod|
          puts "#{mod}微博主类#{mod}::Client已生成..."
          #通过微博名的字符串获取微博类的类名
          modul = Object.const_get(mod)
          #生成Weibo::Client主类,通用的Weibo代码通过include引入
          modul.module_eval <<-RUBY
           class Client < OAuth2::Client
           include Weibo::Common
           include Weibo::AccessToken
           
             #下面两个方法是Sina微博用来获取access_token的
             def get_token_from_hash(hash)
               access_token = hash.delete(:access_token) || hash.delete('access_token')
               opts = {:expires_at => (hash.delete(:expires_at) || hash.delete('expires_at')),
                       :header_format => "OAuth2 %s",
                       :param_name => "access_token"}

               @access_token = #{mod}::AccessToken.new(self, access_token, opts)
             end

             def auth_code
               @auth_code ||= #{mod}::Strategy::AuthCode.new(self)
             end
             
             #通过类名遍历对应存放微博api文件的文件夹生成引用api的方法
             #通过Weibo::Client.instance_methods(false)查看实例方法
             Focus::FocusApi.generate_api('#{mod}')

           end 
          RUBY
        end
      end
      
    end
  end
  #require及api函数的动态生成
  class FocusApi
    class << self
      attr_accessor :api_dir_array
      #require所有api文件
      #其他微博主类都是动态生成
      #参数require_dir存放api文件夹的父文件夹名
      def generate_require_from(require_dir)
        #基类文件的引用放在前面
        #递归文件夹时无法保证基类文件引用在前面
        r_array = Array.new
        d_path = File.join(File.dirname(__FILE__),require_dir)
        api_dir_array = String.new
        Dir.foreach(d_path) do |dir|
          next if dir == "." or dir == ".."
          api_dir_array << dir + "-"
          f_path = File.join(File.dirname(__FILE__),require_dir,dir)
          #遍历api文件夹
          Dir.foreach(f_path) do |file|
            #判断引用文件的类型
            next unless File.extname(file) ==".rb"
            r_path = File.join(require_dir,dir,File.basename(file,".rb"))
            r_array.push r_path.to_s
          end
        end
        self.api_dir_array = api_dir_array
        #给引用文件数组排序，基类base文件放在最前面
        r_array.sort_by! { |item| [File.basename(item)=="base" ? 0 : 1,item] }
        r_array.each { |api| eval(%Q[require '#{api}']) }
      end
      
      def check_weibo_class(c_array)
        #c_array.keep_if { |item| self.api_dir_array.include? item.downcase }
        w_array = Array.new
        n_array = Array.new
        c_array.each do |item|
          @api_dir_array.include?(item.downcase) ? w_array.push(item) : n_array.push(item)
        end
        return w_array, n_array
      end
      
      #批量生产指定Weibo类内部使用的api引用
      #动态生成指定类的方法须使用类名即：Sina::Client.send(:define_method,:api)..
      #在微博主类Weibo::Client中使用
      def generate_api(c_klass)
        klass = Object.const_get(c_klass)
        path = File.join(File.dirname(__FILE__),"focus_api",c_klass.downcase)
        Dir.foreach(path) do |file|
          next unless File.extname(file) ==".rb" 
          f_name = File.basename(file,".rb")
          f_klass = f_name.capitalize
          c_param = c_klass == "Sina" ? "@access_token" : "@params"
          klass::Client.send(:define_method, f_name.to_sym) do
          eval "@#{f_name} ||= #{klass}::Api::#{f_klass}.new(#{c_param}) if #{c_param}"
          end
        end 
      end
      
    end
  end
  
end
