module Wangyi
  module Api
    class Location < Base 
    
      #获取地点列表 	(/location/venues)
						#lat 	可选参数即纬度。范围在+90.0 到 -90.0，如果超出这个范围则忽略该值，必须与long参数一起使用，否则忽略该值；
						#long 	可选参数即经度。范围在+180.0到-180.0，如果超出这个范围则忽略该值，必须与lat参数一起使用，否则忽略该值；
						#count 	可选参数 返回数据的个数，默认为10，最大为50；
						#q	可选参数 	搜索关键字，必须与经纬度（lat,long）参数同时使用才有效，,根据定位的数据在用户所在的城市搜索相应的POI，如没有经纬度参数或无结果返回404； 
      def venues(opts={})
        hashie get("location/venues.json",opts)
      end
      #获取与地理位置相关的微博列表 	(/statuses/location_timeline)
						#lat 可选参数	即纬度。范围在+90.0 到 -90.0，如果超出这个范围则忽略该值，必须与long参数一起使用，否则忽略该值；
						#long 可选参数 即经度。范围在+180.0到-180.0，如果超出这个范围则忽略该值，必须与lat参数一起使用，否则忽略该值；
						#vid 	可选参数 	即POI的id，单独使用时值返回包含此vid的微博。如果经纬度也同时传入，则将两种微博（包含vid或经纬度的）一起返回，按照发微博的时间倒序排列。如果根据vid找不到相应的poi且无定位参数时则返回404；
						#count 	可选参数 	返回微博的个数，默认为30，最大为200
						#since_id 	可选参数 	该参数需传cursor_id,返回此条索引之前发的微博列表,不包含此条；
						#max_id 	可选参数 	该参数需传cursor_id,返回此条索引之后发的微博列表，包含此条；
      def location_timeline(opts={})
        hashie get("statuses/location_timeline.json",opts)
      end
      #上报地址位置 	(/location/report)
						# lat 	必选参数 	即纬度。范围在+90.0 到 -90.0，如果超出这个范围则返回400；
						#long 	必选参数 	即经度。范围在+180.0到-180.0，如果超出这个范围则返回400。 
      def report(opts={})
        hashie get("location/report.json",opts)
      end
      #获取临近用户 	(/location/search_neighbors)
      #参数同report
      def search_neighbors(opts={})
        hashie get("location/search_neighbors.json",opts)
      end
      
    end
  end
end
