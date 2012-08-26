require "open-uri"
require "net/http"
require "oauth2"
require 'hashie'
require 'json'
#微博授权及获取access_token的认证代码
#授权方式以oauth2为标准，授权参数一致
module Weibo
  #通用方法代码
  module Common
    #所有引用类都共有的代码
    #oauth2默认的initialize函数,每个动态生成的微博类把自己的oauth2信息赋值
    def initialize(client_id='', client_secret='', opts={}, &block)
      #获取引用微博类的类名，本函数在每个微博类唯一的一点区别
      klass = Object.const_get self.class.to_s.split("::")[0]

      client_id = klass::Config.api_key if client_id.empty?
      client_secret = klass::Config.api_secret if client_secret.empty?
      super
      @site = klass::Config.site
      @options[:authorize_url] = klass::Config.authorize_url
      @options[:token_url] = klass::Config.token_url
    end
    #通过继承的authorize_url生成授权url，跳转到授权界面
    def authorize_url(params={})
      klass = Object.const_get self.class.to_s.split("::")[0]
      params[:client_id] = @id unless params[:client_id]
      params[:response_type] = 'code' unless params[:response_type]
      params[:redirect_uri] = klass::Config.redirect_uri unless params[:redirect_uri]
      super
    end

    #为微博类赋值用户信息，在创建微博类实例时赋值
    def assign_params(params={})
      @params = params
    end

  end
 
  #以oauth2标准获取access_token，参数一致
  module AccessToken
    #通过code换取access_token
    def get_access_token(code)
      klass = Object.const_get self.class.to_s.split("::")[0]
      uri = URI klass::Config.site 
      uri.path = klass::Config.token_url
      
      uri.query = URI.encode_www_form(
        :client_id => klass::Config.api_key,
        :client_secret => klass::Config.api_secret,
        :redirect_uri => klass::Config.redirect_uri,
        :grant_type => "authorization_code",
        :code =>  code.to_s)
      
      if klass == Sina
        #新浪通过post获取access_token，独立放置
        response = Faraday.new.post(uri)
        json_body = JSON.parse(response.body)
      else
        #其他微博直接通过返回的code再次获取access_token信息
        param = open(uri).read
        json_body = JSON.parse(param)
      end
      expires_at = json_body["expires_in"].to_i + Time.now.to_i
      json_body.merge!({"expires_at" => expires_at})

      Hashie::Mash.new json_body
    end

    #Sina暂时未提供刷新access_token的api接口
    #其他微博可以自动刷新，免去了一些麻烦
    def refresh_token(refresh_token)
      klass = Object.const_get self.class.to_s.split("::")[0]
      uri = URI klass::Config.site 
      uri.path = klass::Config.token_url
      query = {
        :client_id => klass::Config.api_key,
        :grant_type => "refresh_token",
        :refresh_token =>  refresh_token
        }  
      uri.query = URI.encode_www_form(query)

      param = open(uri).read
      json_body = JSON.parse(param)
      expires_at = json_body["expires_in"].to_i + Time.now.to_i
      json_body.merge!({"expires_at" => expires_at})

      Hashie::Mash.new json_body
    end
  end
  
end
