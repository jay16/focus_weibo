module QQ
  module Api
    class User < Base
      
      #获取自己的详细资料
      def info()
        hashie get("user/info.json")
      end
      
      #更新用户信息
						#nick 	昵称
						#sex 	性别（0：未填，1：男，2：女）
						#year 	出生年（1900-2010 ）
						#month 	出生月（1-12 ）
						#day 	出生日（1-31 ）
						#countrycode 	国家码
						#provincecode 	地区码
						#citycode 	城市码
						#introduction 	个人介绍
      def update(opts={})
        #hashie post("user/update.json",opts)
      end
      
      #更新用户头像信息
      #pic 	文件域表单名。本字段不能放入到签名参数中，不然会出现签名错误
      def update_head(pic,opts={})
        #hashie post("user/update_head.json",{:pic => pic}.merge(opts))
      end
      
      #更新用户教育信息
						#feildid 	教育信息记录id（添加：feildid=1；修改和删除：fieldid通过调用user/info接口获取，删除：下面四个参数均为空）
						#year 	入学年限
						#schoolid 	学校id
						#departmentid 	院系id
						#level 	学历
      def update_edu(opts={})
        #hashie post("user/update_edu.json",opts)
      end
      
      #获取其他人资料
						#name 	他人的帐户名（可选）
						#fopenid 	他人的openid（可选）
						#name和fopenid至少选一个，若同时存在则以name值为主 
      def other_info(opts={})
        hashie get("user/other_info.json",opts)
      end
      
      #获取一批人的简单资料
						#names 	用户id列表，用逗号“,”隔开，如 abc,edf,xxxx（最多30，可选）
						#fopenids 	你需要读取的用户openid列表，用下划线“_”隔开
						#names和fopenids至少选一个，若同时存在则以names值为主
      def infos(opts={})
        hashie get("user/infos.json",opts)
      end
      
      #验证账户是否合法
						#name 	他人的帐户名（可选）
						#fopenid 	他人的openid（可选）
						#name和fopenid至少选一个，若同时存在则以name值为主 
      def verify(opts={})
        #hashie post("user/verify.json",opts)
      end
      
      #获取心情微博
						#name 	他人的帐户名（可选）
						#fopenid 	他人的openid（可选）
						#name和fopenid至少选一个，若同时存在则以name值为主
						#pageflag 	
						#    pageflag=0表示回首页
						#    pageflag=1表示向下翻页：id和timestamp是上一页的最后一个帖子id和时间(不是根节点)；
						#    pageflag=2表示向上翻页：id和timestamp是下一页的第一个帖子id和时间(不是根节点)； 
						#id 	第一次请求填0，后面按照pageflag的说明进行翻页操作
						#timestamp 	第一次请求填0，后面按照pageflag的说明进行翻页操作
						#emotiontype 	自定义标志位，表示取那种心情类型的帖子，按值使用。0xFFFFFFFF表示取所有类型
						#reqnum 	请求拉取的帖子数（最大不能超过70）
						#listtype 	结果集标识。0-返回最近的一次心情，1-返回所有心情列表，默认为0
      def emotion(opts={})
        #hashie post("user/emotion.json",opts)
      end
      
    
    end
  end
end
