require 'hashie'
require 'json'
require 'faraday'
require 'net/http/post/multipart'

module Wangyi
  module Api
    class Base
      extend Forwardable
      
      def initialize(params)
        @params = params
      end
      
      def hashie(response)
        json_body = JSON.parse(response.body)
        if json_body.is_a? Array
          Array.new(json_body.count){|i| Hashie::Mash.new(json_body[i])}
        else
          Hashie::Mash.new json_body
        end
      end
      
      def get(path,opts={},params=@params)
        url = "https://api.t.163.com/"
        url << path + "?"
        url << "access_token=#{params['access_token']}"
        
        p_str = convert_params(opts)
        url << p_str
        
        puts url
        Faraday.get(url)
      end
      
      def convert_params(hash)
        s = String.new
        hash.each do |key, value|
          s << "&#{key}=#{value}"
        end
        s
      end
      
    end
  end
end
