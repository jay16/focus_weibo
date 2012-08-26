module Wangyi
  module Api
    class Blocks < Base  
    
				  #阻止指定用户
						#user_id 	可选参数 	用户ID，主要是用来区分用户ID跟微博昵称相同产生歧义的情况。
						#screen_name 	可选参数 	该用户的个性网址，也可以传user_id；
				  def create(opts={})
				    hashie post("blocks/create.json",opts)
				  end
				  #取消已阻止的用户
				  #参数同create
				  def destroy(opts={})
				    hashie post("blocks/destroy.json",opts)
				  end
				  #判断指定用户是否已被阻止
				  #参数同create
				  def exists(opts={})
				    hashie get("blocks/exists.json",opts)
				  end
				  #查看已阻止的用户列表 	(blocks/blocking)
				  def blocking
				    hashie get("blocks/blocking.json")
				  end
				  #查看已阻止的用户列表id数组 	(blocks/blocking/ids)
				  def blocking_ids
				    hashie get("blocks/blocking/ids.json")
				  end
    
    end
  end
end
