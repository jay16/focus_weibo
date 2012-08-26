module Wangyi
  module Api
    class Friendships < Base
    #关注指定用户
    #user_id screen_name二选一
    def create(opts={})
      hashie post("friendships/create.json",opts)
    end
    #取消关注指定用户 
    #user_id screen_name二选一
    def destroy(opts={})
      hashie post("friendships/destroy.json",opts)
    end
    #获取两个用户的相互关注关系 
				#source_id 	可选参数 	指定用户的userId
				#source_screen_name 	可选参数 	指定用户的个性网址
				#target_id 	可选参数 	指定用户的userId
				#target_screen_name 	可选参数 	目标用户的个性网址，
    def show(opts={})
      hashie get("friendships/show.json",opts)
    end
    #获取指定用户的关注列表 	(statuses/friends)
    #user_id screen_name二选一
    #cursor 	可选参数 	分页参数，单页只能包含30个关注列表。
    def friends(opts={})
      hashie get("statuses/friends.json",opts)
    end
    #获取指定用户的被关注列表
    #参数同friends
    def followers(opts={})
      hashie get("statuses/followers.json",opts)
    end
    #获取当前用户的关注人名字列表 
    def names
      hashie get("friends/names.json")
    end
    #获取指定用户的被关注的人名字列表，可用于发私信查找用户 	(statuses/followers/names)
				# user_id 	可选参数 	指定用户ID，主要是用来区分用户ID跟微博昵称相同产生歧义的情况。
				#screen_name 	可选参数 	指定该用户的个性网址，也可以传user_id；
				#cursor 	可选参数 	分页参数，返回cursor之后的结果，包括cursor，可与count参数配合使用
				#count 	可选参数 	数量，默认为30。
				#matchkey 	可选参数 	按照拼音或汉字模糊匹配的key，默认为空串（不做过滤）。
				#show_img	可选参数 	为true显示头像的图片，默认不显示 
    def followers_names(opts={})
      hashie get("statuses/followers/names.json",opts)
    end
    
    end
  end
end
