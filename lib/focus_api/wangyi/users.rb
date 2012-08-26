module Wangyi
  module Api
    class Users < Base
    
    #获取指定用户的信息 	(users/show)
				#id 	可选参数 	用户的个性网址或用户ID；#name 	可选参数 	用户的昵称
				#user_id 	可选参数 	用户ID	#screen_name 		用户的个性网址
    def show(opts={})
      hashie get("users/show.json",opts)
    end
    #猜你喜欢
    #page_no 	可选参数 	指定返回推荐用户的页号，默认为第一页
    #page_size 	可选参数 	指定返回每一页的用户数。默认为30个，如返回第61-90个推荐用户可使page_no=3，page_size=30；
    def suggestions(opts={})
      hashie get("users/suggestions.json",opts)
    end
    #获取推荐I达人列表
				#cursor 	可选参数 	分页参数，请求示例：http://api.t.163.com/users/suggestions_i_followers.json?cursor=30
				#trim_user 	可选参数 	值为true时返回最基本的用户数据，使用此参数可以减少返回数据量，默认为false；
    def suggestions_i_followers(opts={})
      hashie get("users/suggestions_i_followers.json",opts)
    end
    #用户创建的分组
    def groups
      hashie get("users/groups.json")
    end
    #修改用户分组 	(users/modify_user_groups)
				#user_id 		需要修改的用户id
				#group_ids 		逗号隔开的多个groupid，把用户放进这些组里面，空白代表全部删除。如：group_ids=1,2,3 把用户放进1,2,3三个组中。group_ids=1,3，用户从2中移除。group_ids=表示全部移除
    def modify_user_groups(opts={})
      hashie post("users/modify_user_groups.json",opts)
    end
    #获取用户的微专栏信息
    #user_id screen_name name三选一
    def column_info(opts={})
      hashie get("column/info.json",opts)
    end
    
    
    
    end
  end
end
