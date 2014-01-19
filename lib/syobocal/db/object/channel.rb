module Syobocal
  module DB
    module Object

      class Channel < Base
        attr_reader :chid, :name, :epg_name, :url, :ch_gid

        @mappings = [
          [:@chid, "ChID", :int],
          [:@name, "ChName"],
          [:@epg_name, "ChiEPGName"],
          [:@url, "ChURL"],
          [:@ch_gid, "ChGID", :int] ].freeze

        @path_to_elements = "ChLookupResponse/ChItems/ChItem".freeze
      end

    end
  end
end