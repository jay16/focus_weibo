module QQ
  module Api
    class List < Base
    
      #名单订阅成员列表信息
						#listid 	名单id
						#page 	第几页（从0开始，每页15条数据）
      def list_followers(listid, opts={})
        #hashie post("list/list_followers.json",{:listid => listid}.merge(opts))
      end
      
						#我订阅的名单信息
						#pageflag 	请求第几页（从0开始，每页15条数据）
      def myfollowlist(opts={})
        #hashie post("list/myfollowlist.json",opts)
      end
      
						#创建名单
						#name 	名单的名称（128字节，仅支持中文、字母、数字、下划线或减号）
						#description 	名单的描述（420字节）
						#tag 	名单的标签，每个标签8个字以内，以空格间隔，最多填写10个
						#    （256字节，仅支持中文、字母、数字）

						#access 	浏览权限
						#    0:所有人可见
						#    1:只有我自己可见 
      def create(opts={})
        #hashie post("list/create.json",opts)
      end
      
						#删除名单
						#listid 	名单的id
      def delete(listid, opts={})
        #hashie post("list/delete.json",{:listid => listid}.merge(opts))
      end
      
						#page 	第几页（从0开始，每页15条数据）
						#listid 	名单id
						#name 	名单的名称（128字节，仅支持中文、字母、数字、下划线或减号）
						#description 	名单的描述（420字节）
						#tag 	名单的标签，每个标签8个字以内，以空格间隔，最多填写10个
						#     （256字节，仅支持中文、字母、数字）
						#access 	浏览权限
						#    0:所有人可见
						#    1:只有我自己可见 
      def edit(opts={})
        #hashie post("list/edit.json",opts)
      end
      
      #查询我创建的名单
      def get_list(opts={})
        #hashie post("list/get_list.json",opts)
      end
      
      #筛选指定的用户是否在名单中
						#listids 	名单列表，以逗号“,”分隔，如123,456（最多30个）
						#name 	用户帐号（可选）
						#fopenid 	用户的openid（可选）
						#name和fopenid至少选一个，若同时存在则以name值为主 
      def check_user_in_list(opts={})
        #hashie post("list/check_user_in_list.json",opts)
      end
      
      #名单属性信息
      #listids 	名单列表，以逗号“,”分隔，如123,456（最多不超过10个）
      def list_attr(listids, opts={})
        #hashie post("list/list_attr.json",{:listids => listids}.merge(opts))
      end
      
      #订阅多个名单
      #listids 	名单列表，以逗号“,”分隔，如123,456（最多不超过30个）
      def follow(listids, opts={})
        #hashie post("list/follow.json",{:listids => listids}.merge(opts))
      end
      
      #取消订阅多个名单
      #listids 	名单列表，以逗号“,”分隔，如123,456（最多不超过30个）
      def undo_follow(listids, opts={})
        #hashie post("list/undo_follow.json",{:listids => listids}.merge(opts))
      end
      
      #收录指定用户到名单
						#names 	用户账号列表，以“,”分隔，如aaa,bbb（可选，最多不超过8个）
						#fopenids 	你需要读取的用户openid列表，用下划线“_”隔开（可选，最多不超过8个）
						#names和fopenids至少选一个，若同时存在则以names值为主
						#listid 	名单id
      def add_to_list(listid, opts={})
        #hashie post("list/add_to_list.json",{:listid => listid}.merge(opts))
      end
      
      #从名单中删除指定用户
      #同add_to_list
      def del_from_list(listid, opts={})
        #hashie post("list/del_from_list.json",{:listid => listid}.merge(opts))
      end
      
      #查询指定用户所在的所有list
						#name 	用户帐号（可选）
						#fopenid 	用户的openid（可选）
						#name和fopenid至少选一个，若同时存在则以name值为主 
      def get_other_in_list(opts={})
        #hashie post("list/get_other_in_list.json",opts)
      end
      
      #查询名单成员列表
						#listid 	名单id
						#pageflag 	第几页(0是第一页，每页有15个） 
      def listusers(listid, opts={})
        #hashie post("list/listusers.json",{:listid => listid}.merge(opts))
      end
      
      #查询指定微博用户的名单相关信息
						#names 	用户账号列表，以“,”分隔，如aaa,bbb（可选，最多不超过30个）
						#fopenids 	你需要读取的用户openid列表，用下划线“_”隔开（可选，最多不超过30个）
						#names和fopenids至少选一个，若同时存在则以names值为主 
      def list_info(opts={})
        #hashie post("list/list_info.json",opts)
      end
    
    end
  end
end
