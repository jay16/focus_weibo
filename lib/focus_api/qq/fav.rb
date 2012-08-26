module QQ
  module Api
    class Fav < Base
    
      #收藏一条微博
      def addt(id, opts={})
        #hashie post("fav/addt.json",{:id => id}.merge(opts))
      end
    
      #取消收藏一条微博
      def delt(id, opts={})
        #hashie post("fav/delt.json",{:id => id}.merge(opts))
      end
    
      #收藏的微博列表
						#pageflag 	分页标识（0：第一页，1：向下翻页，2：向上翻页）
						#pagetime 	翻页用，第一页时：填0；向上翻页：填上一次请求返回的prevtime字段值；向下翻页：填上一次请求返回的nexttime字段值
						#reqnum 	每次请求记录的条数（1-100条）
						#lastid 	翻页用，第一页时：填0；继续向
      def list_t(opts={})
        hashie get("fav/list_t.json",opts)
      end
    
      #订阅话题
      def addht(id, opts={})
        #hashie post("fav/addht.json",{:id => id}.merge(opts))
      end
    
      #取消订阅话题
      def delht(id, opts={})
        #hashie post("fav/delht.json",{:id => id}.merge(opts))
      end
    
      #获取已订阅话题列表
						#reqnum 	  请求数（最多15）
						#pageflag 	翻页标识（0：首页 1：向下翻页 2：向上翻页）
						#pagetime 	翻页用，第一页时：填0；向上翻页：填上一次请求返回的第一条记录时间；向下翻页：填上一次请求返回的最后一条记录时间
						#lastid 	  翻页用，第一页时：填0；继续向上翻页：填上一次请求返回的第一条记录id；继续向下翻页：填上一次请求返回的最后一条记录id
      def list_ht(opts={})
        hashie get("fav/list_ht.json",opts)
      end
    
    end
  end
end
