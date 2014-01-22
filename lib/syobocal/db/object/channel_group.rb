module Syobocal
  module DB
    module Object

      class ChannelGroup
        extend XMLMapper 
        map attr: :ch_gid, xpath: "ChGID", type: :int
        map attr: :name,   xpath: "ChGroupName"

        root_node "ChGroupLookupResponse/ChGroupItems/ChGroupItem"
      end

    end
  end
end
