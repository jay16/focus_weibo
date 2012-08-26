module Sina
  module Api
    class Notification < Base
      #read interfaces
      def send(uids, tpl_id, opt={})
        hashie get("notification/send.json", :params => {:uids => uids, :tpl_id => tpl_id}.merge(opt))
      end
    end
  end
end
