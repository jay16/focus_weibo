module QQ
  module Api
    class Statuses < Base
      
      #主页时间线
      def home_timeline()
        hashie get("statuses/home_timeline.json")
      end
      
      #广播大厅时间线
      def public_timeline()
        hashie get("statuses/public_timeline.json")
      end
      
      #其他用户发表时间线
      def user_timeline()
        hashie get("statuses/user_timeline.json")
      end
      
      #用户提及时间线
      def mentions_timeline()
        hashie get("statuses/mentions_timeline.json")
      end
      
      #时间线/我发表时间线
      def broadcast_timeline()
        hashie get("statuses/broadcast_timeline.json")
      end
      
      #时间线/特别收听的人发表时间线
      def special_timeline()
        hashie get("statuses/special_timeline.json")
      end
      
      # 地区发表时间线
      def area_timeline()
        hashie get("statuses/area_timeline.json")
      end
      
      #时间线/主页时间线索引
      def home_timeline_ids()
        hashie get("statuses/home_timeline_ids.json")
      end
      
      #时间线/其他用户发表时间线索引
      def user_timeline_ids()
        hashie get("statuses/user_timeline_ids.json")
      end
      
      #时间线/我发表时间线索引
      def broadcast_timeline_ids()
        hashie get("statuses/broadcast_timeline_ids.json")
      end
      
      #时间线/用户提及时间线索引
      def mentions_timeline_ids()
        hashie get("statuses/mentions_timeline_ids.json")
      end
      
      #时间线/多用户发表时间线
      def users_timeline()
        hashie get("statuses/users_timeline.json")
      end
      
      #时间线/多用户发表时间线索引
      def users_timeline_ids()
        hashie get("statuses/users_timeline_ids.json")
      end
      
      #时间线/话题时间线(新)
      def ht_timeline_ext()
        hashie get("statuses/ht_timeline_ext.json")
      end
      
      #时间线/拉取vip用户发表微博消息接口
      def home_timeline_vip()
        hashie get("status/home_timeline_vip.json")
      end
      
      #时间线/获取二传手列表
      def sub_re_list()
        hashie get("statuses/sub_re_list.json")
      end
      
    end
  end
end
