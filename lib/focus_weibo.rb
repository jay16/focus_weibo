#encoding:utf-8
require 'focus_config'

#遍历引用focus_api文件夹下的.rb文件
Focus::FocusApi.generate_require_from("focus_api")

#微博参数数据配置，程序启动时自动加载
#配置yml文件名必须为focus_weibo.yml放在config下
if File.exists?('config/focus_weibo.yml')
  weibo_oauth = YAML.load_file('config/focus_weibo.yml')
  #yml配置文件的信息要按照后面的格式排版
  w_array = Array.new  
  weibo_oauth.each do |key,value|
    #yml配置文件key为类名的字符串形式，首字母必须大写
    #否则微博相关的类无法正确生成
    #这里定义的类名也为以后调用微博类的名称
    w_array.push(key)
  end
  #以focus_api文件夹下的微博api文件夹为参考
  #只能生成已定义微博类范围的微博类
  w_array, n_array = Focus::FocusApi.check_weibo_class(w_array)
  #可能配置yml文件中定义的微博，在本gem中未定义
  n_array.each do |no_item|
    puts "#{no_item}微博api接口暂未实现^_^^_^^_^"
  end
  #根据微博名数组生成微博Weibo::Client主类
  Focus::Modul.generate_weibo_client(w_array)
  #根据微博名数组生成微博Weibo::Config类
  Focus::Modul.generate_config_module(w_array)
  #根据微博名数组使用Weibo::Config类读取配置参数信息
  Focus::Modul.read_oauth_config(w_array,weibo_oauth)
  
else
  warn =  "\n\n=========================================================\n"
  warn << "  Warning:\n\n"
  warn << "  You haven't made a config/focus_weibo.yml file You should.  \n\n"
  warn << "  The focus_weibo gem will work much better if you do.\n\n"
  warn << "  Please set \n"
  warn << "    Weibo::Config.api_key = ... \n"
  warn << "    Weibo::Config.api_secret = ...\n"
  warn << "    Weibo::Config.redirect_uri = ... \n"
  warn << "  somewhere in your initialization process\n\n"
  warn << "=========================================================\n\n"
  puts warn
end

#yml配置信息格式
#Sina:
#  development:
#    site: https://api.weibo.com/2/
#    authorize_url: /oauth2/authorize
#    token_url: /oauth2/access_token
#    api_key: 1713173982
#    api_secret: 62170dacd0fa1c70d4eb1263a0855744
#    redirect_uri: http://192.168.184.16:3000/sina_weibo/callback
#  production:
#    site: https://api.weibo.com/2/
#    authorize_url: /oauth2/authorize
#    token_url: /oauth2/access_token
#    api_key: 1713173982
#    api_secret: 62170dacd0fa1c70d4eb1263a0855744
#    redirect_uri: http://192.168.184.16:3000/sina_weibo/callback
#  ...
