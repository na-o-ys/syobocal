module Syobocal
  module DB
    module Object

      class Channel
        extend XMLMapper 
        map attr: :chid,     xpath: "ChID", type: :int
        map attr: :name,     xpath: "ChName"
        map attr: :epg_name, xpath: "ChiEPGName"
        map attr: :url,      xpath: "ChURL"
        map attr: :ch_gid,   xpath: "ChGID", type: :int

        root_node "ChLookupResponse/ChItems/ChItem"
      end

    end
  end
end
