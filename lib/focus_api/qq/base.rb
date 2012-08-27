require 'hashie'
require 'json'
require 'faraday'
require 'net/http/post/multipart'

module QQ
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
        url = "https://open.t.qq.com/api/"
        url << path
        puts url
        uri = URI url
        
        params.merge!({
          :oauth_consumer_key => QQ::Config.api_key,
          :oauth_version => "2.a", 
          :scope => "all"})
        unless opts.empty?
          params.merge!(opts)
        end
        
        uri.query = URI.encode_www_form(params)
        
        Faraday.get(uri)
      end
      
      def post(path,opts={},params=@params)
        conn = Faraday.new(:url => 'https://open.t.qq.com')
        #如果上传图片，要另行设置
        if opts.has_key?(:pic)
          puts "image upload"
          conn = Faraday.new(:url => 'https://open.t.qq.com') do |f|  
            f.request :multipart  
            f.adapter :net_http  
          end 
        end
        
        params.merge!({:format => "json",
                       :oauth_consumer_key => "#{QQ::Config.api_key}",
                       :content_type => 'application/www-form-urlencoded',
                       :oauth_version => "2.a", 
                       :scope => "all"})
                          
        params.merge!(opts) unless opts.empty?
         
        conn.post('/api/'+path,params)
      end
      
      protected
      
      def self.mime_type(file)
        case
          when file =~ /\.jpg/ then 'image/jpg'
          when file =~ /\.gif$/ then 'image/gif'
          when file =~ /\.png$/ then 'image/png'
          else 'application/octet-stream'
        end
      end
      
      CRLF = "\r\n"
      def self.build_multipart_bodies(parts)
        boundary = Time.now.to_i.to_s(16)
        body = ""
        parts.each do |key, value|
          esc_key = CGI.escape(key.to_s)
          body << "--#{boundary}#{CRLF}"
          if value.respond_to?(:read)
            body << "Content-Disposition: form-data; name=\"#{esc_key}\"; filename=\"#{File.basename(value.path)}\"#{CRLF}"
            body << "Content-Type: #{mime_type(value.path)}#{CRLF*2}"
            body << value.read
          else
            body << "Content-Disposition: form-data; name=\"#{esc_key}\"#{CRLF*2}#{value}"
          end
          body << CRLF
        end
        body << "--#{boundary}--#{CRLF*2}"
        puts body
        {
          :body => body,
          :headers => {"Content-Type" => "multipart/form-data; boundary=#{boundary}"}
        }
      end
    end
  end
end
