module Syobocal
  module DB
    module Object

      class Title
        extend XMLMapper 
        map :id,                   "TID",           :int
        map :title,                "Title"
        map :first_year,           "FirstYear",     :int
        map :first_month,          "FirstMonth",    :int
        map :first_finished_year,  "FirstEndYear",  :int
        map :first_finished_month, "FirstEndMonth", :int
        map :subtitles_raw,        "SubTitles"
        map :category,             "Cat",           :int
        map :last_update,          "LastUpdate",    :datetime

        root_node "TitleLookupResponse/TitleItems/TitleItem"

        def subtitles
          return @subtitles if @subtitles

          subtitles = []
          @subtitles_raw.split("\n").each do |subtitle_raw|
            count    = subtitle_raw[/^\*(\d+)\*/, 1].to_i
            subtitle = subtitle_raw[/^\*\d+\*(.*)$/, 1]
            subtitles << { count: count, subtitle: subtitle }
          end

          @subtitles = subtitles
        end

        def finished?
          @category == 10
        end
      end

    end
  end
end
