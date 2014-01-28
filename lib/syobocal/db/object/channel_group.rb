module Syobocal
  module DB
    module Object

      class ChannelGroup
        extend XMLMapper 
        map :gid,    "ChGID",      :int
        map :name,   "ChGroupName"

        root_node "ChGroupLookupResponse/ChGroupItems/ChGroupItem"
      end

    end
  end
end
