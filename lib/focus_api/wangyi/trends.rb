module Wangyi
  module Api
    class Trends < Base
    
    #推荐话题 	(trends/recommended)
    #last_visit_time_millis 	可选参数 	long型的上次访问时间，使用此参数服务端将返回带有isNew标记的微博列表。 
    def recommended(opts={})
      hashie get("trends/recommended.json",opts)
    end
    #推荐微博标签 	(/trends/recommend_tags)
    def recommend_tags
      hashie get("trends/recommend_tags.json")
    end
    
    end
  end
end
