module Sina
  module Api
    class Common < Base
      #read interfaces
      def code_to_location(codes, opt={})
        hashie get("common/code_to_location.json", :params => {:codes => codes}.merge(opt))
      end
      
      def get_city(province, opt={})
        hashie get("common/get_city.json", :params => {:province => province}.merge(opt))
      end
      
      def get_province(country, opt={})
        hashie get("common/get_province.json", :params => {:country => country}.merge(opt))
      end
      
      def get_country(opt={})
        hashie get("common/get_country.json", :params => opt)
      end
      
      def get_timezone(opt={})
        hashie get("common/get_timezone.json", :params => opt)
      end
    end
  end
end
