module Wangyi
  module Api
    class Statuses < Base
    
    #获取当前登录用户的微博列表(timeline) 
				#count 	可选参数 	数量，默认为30条，最大为200条
				#since_id 	可选参数 	该参数需传cursor_id,返回此条索引之前发的微博列表,不包含此条
				#max_id 	可选参数 	该参数需传cursor_id,返回此条索引之后发的微博列表,包含此条
				#trim_user 	可选参数 	值为true时返回的user对象只包含id属性，该属性能在一定程度上减少返回的数据量
				#filter_type 	可选参数 	需要返回微博的过滤类型，
				  #取值范围0-7，分别代表全部、原创、图片、视频、音乐、跟帖、新闻、话题，默认为0全部，
				  #如果输入超出取值范围则返回全部。 
    def home_timeline(opts={})
      hashie get("statuses/home_timeline.json",opts)
    end
    
    #获取最新的公共微博列表(随便看看),返回最新的20条微博
    #trim_user 	可选参数 	值为true时返回的user对象只包含id属性 
    def public_timeline(opts={})
      hashie get("statuses/public_timeline.json",opts)
    end
    
    #获取@评论当前登录用户的微博列表 
    #参数同home_timeline(没有filter_type)
    def mentions(opts={})
      hashie get("statuses/mentions.json",opts)
    end
    
				#获取指定用户的微博列表(user_id、name与screen_name都为空时或找不到该用户时返回404)。 
    #参数同home_timelin(补充如下)
				#user_id 	可选参数 	主要是用来区分用户ID跟微博昵称相同产生歧义的情况；
				#screen_name 	可选参数 	可以传user_id或screen_name；
				#name 	可选参数 	用户昵称；
    def user_timeline(opts={})
      hashie get("statuses/user_timeline.json",opts)
    end
    
    #获取当前登录用户所发微博被转发的列表 
    #count：可选参数，数量，默认为30条，最大为200条；
    #since_id：可选参数，该参数需传cursor_id,返回此条索引之前发的微博列表,不包含此条； 
    def retweets_of_me(opts={})
      hashie get("statuses/retweets_of_me.json",opts)
    end
    
    #获取当前登录用户发出的评论列表(timeline) 
    #参数同home_timeline(没有filter_type)--trim_user默认为true
    def comments_by_me(opts={})
      hashie get("statuses/comments_by_me.json",opts)
    end
    #获取我收到的评论列表
    #参数同home_timeline(没有filter_type)
    def comments_to_me(opts={})
      hashie get("statuses/comments_to_me.json",opts)
    end
    #某个分组的微博列表
    #参数同home_timeline
    def group_timeline(opts={})
      hashie get("statuses/group_timeline.json",opts)
    end
    #获取指定用户的微专栏列表
    #参数同user_timeline
    def user_column_timeline(opts={})
      hashie get("statuses/user_column_timeline.json",opts)
    end
    #获取指定微专栏列表 
    #参数同home_timeline(没有filter_type)
    def column_timeline(columnId,opts={})
      hashie get("statuses/column_timeline/#{columnId}.json",opts)
    end
    #发布一条新微博
    def update(status,opts={})
      hashie post("statuses/update.json",{:status => status}.merge(opts))
    end 
    #评论一条微博 	(statuses/reply)
				#id 	必选参数 	值为被评论微博的ID。如果回复某条评论，则此值为该评论的id。
				#status 	必选参数 	评论内容。
				#is_retweet 	可选参数 	是否转发 默认不转发 1为转发
    def reply(id, status, opts={})
      hashie post("statuses/reply.json",{:id => id, :status => status}.merge(opts))
    end
    #转发一条微博 	(statuses/retweet)
				#id 	必选参数 	值为被转发微博的ID
				#status 	可选参数 	转发内容，默认为“转发微博。”
    def retweet(id, opts={})
      hashie post("statuses/retweet/#{id}.json", opts)
    end
    #获取指定微博信息
    def show(id)
      hashie get("statuses/show/#{id}.json")
    end
    #删除指定的微博 
    def destroy(id)
      hashie post("statuses/destroy/#{id}.json")
    end
    #获取指定微博的评论列表
    #参数同home_timeline(没有filter_type)
    def comments(id,opts={})
      hashie get("statuses/comments/#{id}.json",opts)
    end
    #获取指定微博的转发列表
    #参数同home_timeline(没有filter_type)
    def retweets(id, opts={})
      hashie get("statuses/retweets/#{id}.json",opts)
    end
    #上传图片 必须用Multipart/form-data方式 
    #pic 支持jpg、png、bmp、gif这四种图片格式，上传图片大小在1K-2M以内,此参数不参与Oauth签名
    def upload(pic)
      hashie post("statuses/upload.json",{:pic => pic})
    end
    
    
    end
  end
end
