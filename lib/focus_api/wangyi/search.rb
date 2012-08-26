module Wangyi
  module Api
    class Search < Base  
    
    #搜索微博 	(search)
				#q 	必选参数 	关键字,最大长度25,如果以#起始的关键字会作为tag搜索精确匹配
				#page 	可选参数 	当前页数，默认为第一页
				#per_page 	可选参数 	返回数量,最大20  
    def statuses(q, opts={})
      hashie get("search.json",{:q => q}.merge(opts))
    end
    #搜索微博 	new(statuses/search)
    #参数同statuses
    #trim_user：可选参数，值为true时返回的user对象只包含id属性，该属性能在一定程度上减少返回的数据量 
    def new(q, opts={})
      hashie get("statuses/search.json",{:q => q}.merge(opts))
    end
    #搜索用户 	(users/search)
    #参数同statuses
    def users(q, opts={})
      hashie get("users/search.json",{:q => q}.merge(opts))
    end
    
    end
  end
end
