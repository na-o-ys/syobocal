module Syobocal
  module DB
    module Object

      class Program < Base
        attr_reader :pid, :tid, :start_datetime, :end_datetime, :count, :chid

        @mappings = [
          [:@pid, "PID", :int],
          [:@tid, "TID", :int],
          [:@start_datetime, "StTime", :datetime],
          [:@end_datetime, "EdTime", :datetime],
          [:@count, "Count", :int],
          [:@chid, "ChID", :int]
        ].freeze

        @path_to_elements = "ProgLookupResponse/ProgItems/ProgItem".freeze
      end

    end
  end
end