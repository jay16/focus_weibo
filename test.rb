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

  		   opts = {:access_token => "a97b15eb32d82940c6ff8513311894fa",
            :openid => "78231A433C5FFBBFF3B164C10FBA0F9A",
            :clientip => "192.168.184.16"
            }
						@qq = QQ::Client.new
						@qq.assign_params(opts)
						@res = @qq.t.add_pic("qq api","P5010004.jpg")
