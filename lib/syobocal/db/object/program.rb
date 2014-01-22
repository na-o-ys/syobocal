module Syobocal
  module DB
    module Object

      class Program
        extend XMLMapper 
        map attr: :pid,            xpath: "PID",    type: :int
        map attr: :tid,            xpath: "TID",    type: :int
        map attr: :start_datetime, xpath: "StTime", type: :datetime
        map attr: :end_datetime,   xpath: "EdTime", type: :datetime
        map attr: :count,          xpath: "Count",  type: :int
        map attr: :chid,           xpath: "ChID",   type: :int

        root_node "ProgLookupResponse/ProgItems/ProgItem"
      end

    end
  end
end
