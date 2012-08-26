module QQ
  module Api
    class Ht < Base
      
      #根据话题名称查询话题id
      # httexts 	话题名字列表，用“,”分隔，如abc,efg（最多30个）
      def ids(httexts, opts={})
        hashie get("ht/ids.json",{:httexts => httexts}.merge(opts))
      end
      
      #根据话题id获取话题相关信息
      #ids 	话题id列表，用“,”分隔，如12345,12345（最多30个）
      def info(ids, opts={})
        hashie get("ht/info.json",{:ids => ids}.merge(opts))
      end
    
    
    
    end
  end
end
