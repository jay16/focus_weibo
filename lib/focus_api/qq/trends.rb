module QQ
  module Api
    class Trends < Base
    
						#话题热榜
						#reqnum 	请求个数（最多20）
						#pos 	请求位置，第一次请求时填0，继续填上次返回的pos
      def ht(reqnum, opts={})
        hashie get("trends/ht.json",{:reqnum => reqnum}.merge(opts))
      end
    
						#转播热榜
						#reqnum 	每次请求记录的条数（1-100条）
						#pos 	翻页标识
						#type 	微博消息类型

						#0x1-带文本 0x2-带链接 0x4-带图片 0x8-带视频
						#如需拉取多个类型请使用|，如(0x1|0x2)得到3，此时type=3即可，填零表示拉取所有类型 
      def t(reqnum, opts={})
        hashie get("trends/t.json",{:reqnum => reqnum}.merge(opts))
      end
    
						#推荐名人列表
						#classid 	请求的名人类别id（如：娱乐明星类别id:101）
						#subclassid 	请求的名人类别的子类别id（如媒体机构类别下子类别广播id：subclass_959，若为空，则默认一个子类别，没有子类别的，此处为空）
      def famouslist(opts={})
        hashie get("trends/famouslist.json",opts)
      end
    
						#
      def user(opts={})
        hashie get("trends/user.json",opts)
      end
    
						#
      def user(opts={})
        hashie get("trends/user.json",opts)
      end
    
						#
      def user(opts={})
        hashie get("trends/user.json",opts)
      end
    
    end
  end
end
