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
a = b = Array.new
a.push("hi")
b.push("wo")
puts a.inspect
puts b.inspect

