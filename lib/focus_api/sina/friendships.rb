module Sina
  module Api
    class Friendships < Base
            
      #read interfaces
      def friends(opt={})
         get("friendships/friends.json", :params => opt)
      end
      
      def friends_in_common(uid, opt={})
         get("friendships/friends/in_common.json", :params => {:uid => uid}.merge(opt))
      end
      
      def friends_bilateral(uid, opt={})
         get("friendships/friends/bilateral.json", :params => {:uid => uid}.merge(opt))
      end
      
      def friends_bilateral_ids(uid, opt={})
         get("friendships/friends/bilateral/ids.json", :params => {:uid => uid}.merge(opt))
      end
      
      def friends_ids(opt={})
         get("friendships/friends/ids.json", :params => opt)
      end
      
      def followers(opt={})
         get("friendships/followers.json", :params => opt)
      end
      
      def followers_ids(opt={})
         get("friendships/followers/ids.json", :params => opt)
      end
      
      def followers_active(uid, opt={})
         get("friendships/followers/active.json", :params => {:uid => uid}.merge(opt))
      end
      
      def friends_chain_followers(uid, opt={})
         get("friendships/friends_chain/followers.json", :params => {:uid => uid}.merge(opt))
      end
      
      def show(opt={})
         get("friendships/show.json", :params => opt)
      end
      
      
      #write interfaces
      def create(opt={})
        hashie post("friendships/create.json", :params => opt)
      end
      
      def destroy(opt={})
        hashie post("friendships/destroy.json", :params => opt)
      end
      
      def remark_update(uid, remark, opt={})
        hashie post("friendships/remark/update.json", :params => {:uid => uid, :remark => remark}.merge(opt))
      end
      
    end
  end
end
