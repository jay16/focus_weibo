module QQ
  module Api
    class Info < Base
     
      #查看数据更新条数
						#op 	请求类型
						#0-仅查询，1-查询完毕后将相应计数清0

						#type 	5-首页未读消息计数，6-@页未读消息计数，7-私信页消息计数，8-新增听众数，9-首页广播数（原创的）
						#      op=0时，type默认为0，此时返回所有类型计数；op=1时，需带上某种类型的type，清除该type类型的计数，并返回所有类型计数 
      def update(opts={})
        hashie get("info/update.json",opts)
      end
    
    
    end
  end
end
