#encoding: utf-8
require 'focus_weibo'
require 'net/http'
require 'json'
require 'hashie'

def clear_tmp(file_path)
		if File.directory? file_path
		  Dir.foreach(file_path) do |file|
		    if file!="." and file!=".."
		      clear_tmp(file_path+"/"+file)
		    end
		  end
		else
		  if File.basename(file_path)[-1]=="~"
		    puts "Clear ~ file:"+ file_path
		    File.delete(file_path)
		  end
		end
end
clear_tmp(File.dirname(__FILE__))

#puts Sina::Client.new.authorize_url
#puts QQ::Client.new.authorize_url
#puts Wangyi::Client.new.authorize_url
url="access_token=a97b15eb32d82940c6ff8513311894fa&expires_in=604800&refresh_token=e768dd2c02e1de1a369a8ccc8ed31f0a&name=jay_16&nick=李俊杰"
#json_body = JSON.parse(url)
 hash = Hash.new
 URI.decode_www_form(url).each do |item|
   hash[item[0]] = item[1]
 end
 puts hash
 js = hash.to_json
 puts js.class
 j_b = JSON.parse(js)
 puts j_b.class
 puts j_b

