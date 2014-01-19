module Syobocal
  module DB
    module Object

      class ChannelGroup < Base
        attr_reader :ch_gid, :name

        @mappings = [
          [:@ch_gid, "ChGID", :int],
          [:@name, "ChGroupName"] ].freeze

        @path_to_elements = "ChGroupLookupResponse/ChGroupItems/ChGroupItem".freeze
      end

    end
  end
end