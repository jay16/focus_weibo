module QQ
  module Api
    class Privates < Base
    
      #发私信
						#name 	对方用户名（可选）
						#fopenid 	对方openid（可选）
						#name和fopenid至少选一个，若同时存在则以name值为主
						#pic 	文件域表单名。本字段不要放在签名的参数中，不然请求时会出现签名错误，图片大小限制在2M。
						#contentflag 	私信类型标识，1-普通私信，2-带图私信
      def add(content,opts={})
        #hashie post("private/add.json",{:content => content}.merge(opts))
      end
    
      #删除一条私信
      def del(id,opts={})
        #hashie post("private/del.json",{:id => id}.merge(opts))
      end
    
      #收件箱
						#pageflag 	分页标识（0：第一页，1：向下翻页，2:向上翻页）
						#pagetime 	本页起始时间（第一页：填0，向上翻页：填上一次请求返回的第一条记录时间，向下翻页：填上一次请求返回的最后一条记录时间）
						#reqnum 	每次请求记录的条数（1-20条）
						#lastid 	用于翻页，和pagetime配合使用（第一页：填0，向上翻页：填上一次请求返回的第一条记录id，向下翻页：填上一次请求返回的最后一条记录id）
						#contenttype 	内容过滤。0-所有类型，1-带文本，2-带链接，4-带图片，8-带视频，0x10-带音频，0x40-带电话录音(IVR语音微博)，默认为0。
      def get(opts={})
        hashie get("private/recv.json",opts)
      end
    
      #发件箱
      #同recv
      def send(opts={})
        hashie get("private/send.json",opts)
      end
    
    end
  end
end
