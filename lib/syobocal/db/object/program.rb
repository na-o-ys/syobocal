module Syobocal
  module DB
    module Object

      class Program
        extend XMLMapper 
        map :pid,            "PID",    :int
        map :tid,            "TID",    :int
        map :start_datetime, "StTime", :datetime
        map :end_datetime,   "EdTime", :datetime
        map :count,          "Count",  :int
        map :chid,           "ChID",   :int

        root_node "ProgLookupResponse/ProgItems/ProgItem"
      end

    end
  end
end
