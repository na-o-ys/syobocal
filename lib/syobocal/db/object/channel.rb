module Syobocal
  module DB
    module Object

      class Channel
        extend XMLMapper 
        map :chid,     "ChID",      :int
        map :name,     "ChName"
        map :epg_name, "ChiEPGName"
        map :url,      "ChURL"
        map :ch_gid,   "ChGID",     :int

        root_node "ChLookupResponse/ChItems/ChItem"
      end

    end
  end
end
