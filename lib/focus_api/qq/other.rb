module QQ
  module Api
    class User < Base
    
      #我可能认识的人
						#reqnum 	请求个数（1-200），默认30
						#startindex 	起始位置（第一页填0，继续向下翻页：填【reqnum*（page-1）】）
      def kownperson(opts={})
        hashie get("lbs/kownperson.json",opts)
      end
    
      #短url变长url
      #url 短url后辍
      def shorturl(url, opts={})
        hashie get("lbs/shorturl.json",{:url => url}.merge(opts))
      end
    
      #获取视频上传的key
      def videokey(opts={})
        hashie get("lbs/videokey.json",opts)
      end
    
      #获取表情接口
      #type 	支持的表情类型（0-17）
      def get_emotions(type, opts={})
        hashie get("lbs/get_emotions.json",{:type => type}.merge(opts))
      end
    
      #一键转播热门排行
						#reqnum 	请求数（最大50个）
						#type 	所请求的热门转播排行的类型，其值及其说明如下：
						#    type=5，表示该请求用于查询同一网站内的一键转播热门排行，
						#    type=6，表示该请求用于查询同一地区内的一键转播热门排行，
						#    此时get请求中需要提供country, province和city的参数值。 
      def gettopreadd(opts={})
        hashie get("lbs/gettopreadd.json",opts)
      end
    
      #拉取我收听的用户的转播消息接口
						#rootid 	转发或者回复的微博根结点ID
						#pageflag 	翻页标识，0：第一页，1：向下翻页，2：向上翻页
						#pagetime 	本页起始时间，和pageflag一起使用，精确定位翻页点，若不需要精确定位，只需给出pageTime
						#第一页：填0，向上翻页：填上一次请求返回的第一条记录时间，向下翻页：填上一次请求返回的最后一条记录时间
						
						#tweetid 	与pageflag和pagetime一起使用，用于翻页
						#第一页：填0，向上翻页：填上一次请求返回的第一条记录id，向下翻页：填上一次请求返回的最后一条记录id
						#reqnum 	用户请求的微博消息数目（最多50个） 
      def follower_trans_conv(opts={})
        hashie get("lbs/follower_trans_conv.json",opts)
      end
    
      #拉取精华转播消息接口
						#rootid 	转发或者回复的微博的根结点ID
						#offset 	起始偏移量，分页用
						#reqnum 	用户请求的微博消息数目（最多50个） 
      def quality_trans_conv(opts={})
        hashie get("lbs/quality_trans_conv.json",opts)
      end
    
      #拉取vip用户的转播消息接口
      #同follower_trans_conv
      def vip_trans_conv(opts={})
        hashie get("lbs/vip_trans_conv.json",opts)
      end
    
      #短url聚合
						#url 	用户提供的需要进行聚合查询的url字符串，既可能是长url也可能是短url
						#pageflag 	翻页标识，0：第一页，1：向下翻页，2：向上翻页
						#pageTime 	本页起始时间，和pageflag一起使用，精确定位翻页点，若不需要精确定位，只需给出pageTime
						#第一页：填0，向上翻页：填上一次请求返回的第一条记录时间，向下翻页：填上一次请求返回的最后一条记录时间

						#tweetid 	与pageflag和pagetime一起，用于翻页
						#第一页：填0，向上翻页：填上一次请求返回的第一条记录id，向下翻页：填上一次请求返回的最后一条记录id
						#type 	查询条件，0x01-原创发表，0x02表示转载，0x40点评类型
						#words 	字数限制，非0-返回微博内容字数大于或等于该值的微博信息，0-无需字数限制
      def url_converge(opts={})
        hashie get("lbs/url_converge.json",opts)
      end
    
      #同话题热门转播
						#checktype 	值为1时表示查询“全时段”排行榜，2表示查询“单周内“排行榜，3表示查询”单月内“排行榜
						#topictype 	用户通过何种方式指定要查询的话题
						#     0-表示按照ID查询，通过topicid参数指定要查询的话题id 
						#     1-表示按照话题标题进行查询，topicname参数指定要查询的话题的标题
						#reqnum 	用户请求的微博消息数目（最多100个） 
      def gettopiczbrank(opts={})
        hashie get("lbs/gettopiczbrank.json",opts)
      end
      
    end
  end
end
