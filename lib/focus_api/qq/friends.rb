module QQ
  module Api
    class Friends < Base
      
      #我的听众列表
						#reqnum 	请求个数(1-30)
						#startindex 	起始位置（第一页填0，继续向下翻页：填【reqnum*（page-1）】）
						#mode 	获取模式，默认为0
						#    mode=0，旧模式，新粉丝在前，只能拉取1000个
						#    mode=1，新模式，拉取全量粉丝，暂不支持排序 
						#install 	过滤安装应用好友（可选）
						#0-不考虑该参数，1-获取已安装应用好友，2-获取未安装应用好友 
      def fanslist(opts={})
        hashie get("friends/fanslist.json",opts)
      end
      
      #我的听众列表(只输出name)
						#reqnum 	请求个数(1-200)
						#startindex 	起始位置（第一页：填0，继续向下翻页：填【reqnum*（page-1）】）
						#install 	过滤安装应用好友（可选）
						#0-不考虑该参数，1-获取已安装应用好友，2-获取未安装应用好友 
      def fanslist_name(opts={})
        hashie get("friends/fanslist_name.json",opts)
      end
      
      #我收听的人列表
      #同fanslist_name
      def idollist(opts={})
        hashie get("friends/idollist.json",opts)
      end
      
      #我收听的人列表(只输出name)
      #同fanslist_name
      def idollist_name()
        hashie get("friends/idollist_name.json")
      end
      
      #黑名单列表
						#reqnum 	请求个数(1-30)
						#startindex 	起始位置（第一页:填0，继续向下翻页：填【reqnum*（page-1）】）
      def blacklist(reqnum,opts={})
        hashie get("friends/blacklist.json",{:reqnum => reqnum}.merge(opts))
      end
      
      #特别收听列表
      #同fanslist_name
      def speciallist(opts={})
        hashie get("friends/speciallist.json",opts)
      end
      
      #收听某个用户
      #只对高级应用开放
      def add()
        #hashie post("friends/add.json")
      end
      
      #取消收听某个用户
						#name 	他人的帐户名（可选）
						#fopenid 	他人的openid（可选）
						#name和fopenid至少选一个，若同时存在则以name值为主 
      def del(opts={})
        #hashie post("friends/del.json",opts)
      end
      
      #获取自己的详细资料
      #同del
      def addspecial(opts={})
        #hashie post("friends/addspecial.json",opts)
      end
      
      #取消特别收听某个用户
      #同del
      def delspecial(opts={})
        #hashie post("friends/delspecial.json",opts)
      end
      
      #添加某个用户到黑名单
      #同del
      def addblacklist(opts={})
        #hashie post("friends/addblacklist.json",opts)
      end
      
      #从黑名单中删除某个用户
      #同del
      def delblacklist(opts={})
        #hashie post("friends/delblacklist.json",opts)
      end
      
						#检测是否我的听众或收听的人
						#names 	其他人的帐户名列表，用逗号“,”分隔，如aaa,bbb（最多30个，可选）
						#fopenids 	其他人的的用户openid列表，用“_”隔开（可选，最多30个）
						#names和fopenids至少选一个，若同时存在则以names值为主 
      def check(opts={})
        hashie get("friends/check.json",opts)
      end
      
      #其他帐户听众列表
      #同fanslist
      def user_fanslist(opts={})
        hashie get("friends/user_fanslist.json",opts)
      end
      
      #其他帐户收听的人列表
      #同fanslist
      def user_idollist(opts={})
        hashie get("friends/user_idollist.json",opts)
      end
      
      #其他帐户特别收听的人列表
      #同fanslist
      def user_speciallist(opts={})
        hashie get("friends/user_speciallist.json",opts)
      end
      
      #我的听众列表，简单信息（200个）
      #同fanslist_name
      def fanslist_s(opts={})
        hashie get("friends/fanslist_s.json",opts)
      end
      
      #我的收听列表，简单信息（200个）
      #同fanslist_name
      def idollist_s(opts={})
        hashie get("friends/idollist_s.json",opts)
      end
      
      #互听关系链列表
						#name 	用户帐户名（可选）
						#fopenid 	用户openid（可选）
						#name和fopenid至少选一个，若同时存在则以name值为主
						#startindex 	起始位置（第一页填0，继续向下翻页：填【reqnum*（page-1）】）
						#reqnum 	请求个数(1-30)
						#install 	过滤安装应用好友（可选）
						#0-不考虑该参数，1-获取已安装应用好友，2-获取未安装应用好友 
      def mutual_list(opts={})
        hashie get("friends/mutual_list.json",opts)
      end
      
      #好友账号及昵称输入提示
						#match 	匹配字符串（目前匹配范围为我的偶像，即我收听的人）
						#采用拆分匹配的规则，如match="cw"，则匹配同时包含c和w的字符串，同时支持拼音首字母匹配
						#reqnum 	请求个数（1-10） 
      def match_nick_tips(opts={})
        hashie get("friends/match_nick_tips.json",opts)
      end
      
      #获取最近联系人列表
      #reqnum 	请求个数（1-20） 
      def get_intimate_friends(reqnum,opts={})
        hashie get("friends/get_intimate_friends.json",{:reqnum => reqnum}.merge(opts))
      end
      
      #获取自己的详细资料
      def info()
        hashie get("friends/info.json")
      end
      
      #获取自己的详细资料
      def info()
        hashie get("friends/info.json")
      end
      
      #获取自己的详细资料
      def info()
        hashie get("friends/info.json")
      end
      
      #获取自己的详细资料
      def info()
        hashie get("friends/info.json")
      end
    
    
    end
  end
end
