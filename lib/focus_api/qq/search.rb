module QQ
  module Api
    class Search < Base

      #搜索用户
						#keyword 	搜索关键字（1-20字节）
						#pagesize 	本次请求的记录条数（1-15个）
						#page 	请求的页码，从1开始 
      def user(keyword, opts={})
        hashie get("search/user.json",{:keyword => keyword}.merge(opts))
      end

      #搜索微博
						#keyword 	搜索关键字（1-128字节）
						#pagesize 	每页大小（1-30个）
						#page 	页码
						#contenttype 	消息的正文类型（按位使用）
						#0-所有，0x01-纯文本，0x02-包含url，0x04-包含图片，0x08-包含视频，0x10-包含音频
						
						#sorttype 	排序方式
						#0-表示按默认方式排序(即时间排序(最新))
						
						#msgtype 	消息的类型（按位使用）
						#0-所有，1-原创发表，2 转载，8-回复(针对一个消息，进行对话)，0x10-空回(点击客人页，进行对话)
						
						#searchtype 	搜索类型
						# 0-默认搜索类型（现在为模糊搜索）
						#1-模糊搜索：时间参数starttime和endtime间隔小于一小时，时间参数会调整为starttime前endtime后的整点，即调整间隔为1小时
						#8-实时搜索：选择实时搜索，只返回最近几分钟的微博，时间参数需要设置为最近的几分钟范围内才生效，并且不会调整参数间隔 
						#starttime 	开始时间，用UNIX时间表示（从1970年1月1日0时0分0秒起至现在的总秒数）
						#endtime 	结束时间，与starttime一起使用（必须大于starttime）
						#province 	省编码（不填表示忽略地点搜索）
						#city 	市编码（不填表示按省搜索）
      def t(keyword, opts={})
        hashie get("search/t.json",{:keyword => keyword}.merge(opts))
      end

      #通过标签搜索用户
      #同user
      def userbytag(keyword, opts={})
        hashie get("search/userbytag.json",{:keyword => keyword}.merge(opts))
      end

      #话题搜索
      #同user
      def ht(keyword, opts={})
        hashie get("search/ht.json",{:keyword => keyword}.merge(opts))
      end

    end
  end
end
