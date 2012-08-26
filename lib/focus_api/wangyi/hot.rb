module Wangyi
  module Api
    class Hot < Base
    
				  #获取当前的热门转发榜
				  #type 	必选参数 	排行榜类型,当前有4种:oneHour,sixHours,oneDay,oneWeek。
				  #size 	可选参数 	返回数量,不传则为默认值(当前为50),最多50。 
				  def topRetweets(type,opts={})
				    hashie get("statuses/topRetweets.json",{:type => type}.merge(opts))
				  end
				  #获取当前的热门跟贴转发榜
				  #size 	可选参数 	返回数量,不传则为默认值(当前为50),最多50 
				  def topFollowRetweets(opts={})
				    hashie get("statuses/topFollowRetweets.json",opts)
				  end
				  #获取发现频道的内容
				  #rss_id 	必选参数 	发现频道id (1每日精选 3网易跟帖 4新闻有态度) 
				  def rss_timeline(rss_id, opts={})
				    hashie get("statuses/rss_timeline.json",{:rss_id => rss_id}.merge(opts))
				  end
   
    end
  end
end
