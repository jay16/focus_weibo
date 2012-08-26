module Wangyi
  module Api
    class Fav < Base
    
      #获取指定用户的收藏列表 	(favorites)
						#id 	必选参数 	可以为该用户的个性网址(screen_name)
						#count 		返回微博数量，默认30，最大200
						#since_id		分页参数，传cursor_id,返回此条微博以前发的微博列表,不包含此条 
      def favorites(id_or_screen_name,opts={})
        hashie get("favorites/#{id_or_screen_name}.json",opts)
      end
      #添加收藏 	(favorites/create)
      #id 	必选参数 	要收藏的微博ID。
      def create(id)
        hashie post("favorites/create/#{id}.json")
      end
      #删除当前用户的收藏 	(favorites/destroy)
      #id 	必选参数 	要收藏的微博ID
      def destroy(id)
        hashie post("favorites/destroy/#{id}.json")
      end
    
    
    end
  end
end
