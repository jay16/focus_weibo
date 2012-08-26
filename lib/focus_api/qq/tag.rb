module QQ
  module Api
    class Tag < Base
    
      #添加标签
      #tag 	标签内容
      def add(tag, opts={})
        #hashie post("tag/add.json",{:tag => tag}.merge(opts))
      end
      
      #删除标签
      #tagid 	标签id
      def del(tagid, opts={})
        #hashie post("tag/del.json",{:tagid => tagid}.merge(opts))
      end
    
    end
  end
end
