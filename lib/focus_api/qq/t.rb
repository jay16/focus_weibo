module QQ
  module Api
    class T < Base
     
     #获取一条微博数据
     def show(id)
        hashie get("t/show.json",{:id => id})
     end
     
     #发表一条微博
     def add(content)
        hashie post("t/add",{:content => content})
     end
     
     #删除一条微博
     def del(id)
        hashie post("t/del",{:id => id})
     end
     
     #转播一条微博 ps: reid 转播父结点微博id content 	微博内容（若在此处@好友，需正确填写好友的微博账号，而非昵称）
     def re_add(reid,content,opts={})
        hashie post("t/re_add",{:reid => reid, :content => content}.merge(opts))
     end
     
     #回复一条微博（即对话）ps:reid 	回复的父结点微博id
     def reply(reid,content,opts={})
        hashie post("t/reply",{:reid => reid, :content => content}.merge(opts))
     end
     
     #发表一条带图片的微博 ps:syncflag 	微博同步到空间分享标记（可选，0-同步，1-不同步，默认为0）
     def add_pic(content,pic,opts={})
        hashie post("t/add_pic",{:content => content, :pic => Faraday::UploadIO.new(pic, 'image/jpeg')}.merge(opts))
     end
     
		   #转播数或点评数 
		   #ids 	微博id的列表（1-30个，用逗号","隔开）
		   #flag 	0－获取转发计数，1－获取点评计数 2－两者都获取
     def re_count(ids,opts={})
        hashie get("t/re_count.json",{:ids => ids}.merge(opts))
     end
     
		   #获取单条微博的转发或点评列表 
		   #ps:rootid 	转发或回复的微博根结点id（源微博id）
		   #     flag 	标识(0－转播列表 1－点评列表 2－点评与转播列表)
		   # pageflag 	分页标识（0：第一页，1：向下翻页，2：向上翻页）
		   #   reqnum 	每次请求记录的条数（1-100条）
		   # pagetime 	本页起始时间（第一页：填0，向上翻页：填上一次请求返回的第一条记录时间，向下翻页：填上一次请求返回的最后一条记录时间
		   #twitterid 	翻页用，第1-100条填0，继续向下翻页，填上一次请求返回的最后一条记录id 
     def re_list(rootid,opts={})
        hashie get("t/re_list.json",{:rootid => rootid}.merge(opts))
     end
     
     #点评一条微博
     #    reid 	点评根结点（非父结点）微博id
     #syncflag 	微博同步到空间分享标记（可选，0-同步，1-不同步，默认为0）
     def comment(reid,content,opts={})
        hashie post("t/comment",{:reid => reid, :content => content}.merge(opts))
     end
     
     #发表音乐微博 ps:url 	音乐地址 title 	音乐名 author 	演唱者
     def add_music(content,url,title,author)
        #hashie post("t/add_music.json",{:content => content,:url => url,:title => title,:author => author})
     end
     
     #发表视频微博 ps:url 	视频地址，后台自动分析视频信息，支持youku,tudou,ku6
     def add_video(url,opts={})
        #hashie post("t/add_video.json",{:url => url}.merge(opts))
     end
     
     #获取视频信息
     def getvideoinfo(url,opts={})
        #hashie post("t/getvideoinfo.json",{:url => url}.merge(opts))
     end
     
		   #根据微博id批量获取微博内容（与索引合起来用）
		   #ps:ids 	微博id列表，用“,”隔开，如123456,456789（请求数量不要超过50个）
     def list(ids,opts={})
        hashie get("t/list.json",{:ids => ids})
     end
     
     #获取转播的再次转播数（二次转发次数)
     def sub_re_count(ids,opts={})
        hashie get("t/sub_re_count.json",{:ids => ids}.merge(opts))
     end
     
     #发表心情帖子 ps: signtype 	心情类型（1，2，3，4，5；默认为1）
     def add_emotion(content,signtype,opts={})
        hashie post("t/add_emotion",{:content => content,:signtype => signtype}.merge(opts))
     end
     
		   #用图片URL发表带图片的微博 
		   #pic_url 	图片的URL地址（URL最长不能超过1024字节） 
     def add_pic_url(content,pic_url,opts={})
        hashie post("t/add_pic_url",{:content => content,:pic_url => pic_url}.merge(opts))
     end
     
     #多类型发表
					#pic_url 	图片URL，可填空（URL最长为1024字节）
					#video_url 	视频URL，可填空（URL最长为1024字节）
					#music_url 	音乐URL，可填空（如果填写该字段，则music_title和music_author都必须填写）
					#music_title 	歌曲名 （UTF8编码）
					#music_author 	歌曲作者（UTF8编码）
     def add_multi(content,opts={})
        hashie post("t/add_multi",{:content => content}.merge(opts))
     end
      
    end
  end
end
