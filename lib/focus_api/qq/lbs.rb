module QQ
  module Api
    class Lbs < Base
    
      #更新地理位置
						#longitude 	经度，例如：22.541321
						#latitude 	纬度，例如：13.935558
      def update_pos(longitude, latitude, opts={})
        #hashie post("lbs/update_pos.json",{:longitude => longitude, :latitude => latitude}.merge(opts))
      end
    
      #删除最后更新位置
      def del_pos()
        #hashie post("lbs/del_pos.json")
      end
    
      #获取POI(Point of Interest)
						#longitude 	经度，例如：22.541321
						#latitude 	纬度，例如：13.935558
						#reqnum 	每次请求记录的条数（1-25条）
						#radius 	POI的半径（单位为米），取值范围为100-1000，为达到比较好的搜索结果，建议设置为200
						#position 	上次查询返回的位置，用于翻页（第一次请求时填0） 
      def get_poi(opts={})
        #hashie post("lbs/get_poi.json",opts)
      end
    
      #获取身边最新的微博
						#longitude 	经度，例如：22.541321
						#latitude 	纬度，例如：13.935558
						#pageinfo 	翻页参数，由上次请求返回（第一次请求时请填空）
						#pagesize 	请求的每页个数（1-50），建议25
      def get_around_new(opts={})
        #hashie post("lbs/get_around_new.json",opts)
      end
    
      #获取身边的人
      #gender 	性别，0-全部，1-男，2-女
      def get_around_people(opts={})
        #hashie post("lbs/get_around_people.json",opts)
      end
    
    end
  end
end
