module Syobocal
  module DB
    module Object

      class Program
        extend XMLMapper 
        map :id,             "PID",        :int
        map :title_id,       "TID",        :int
        map :start_datetime, "StTime",     :datetime
        map :end_datetime,   "EdTime",     :datetime
        map :count,          "Count",      :int
        map :channel_id,     "ChID",       :int
        map :last_update,    "LastUpdate", :datetime

        root_node "ProgLookupResponse/ProgItems/ProgItem"
      end

    end
  end
end
