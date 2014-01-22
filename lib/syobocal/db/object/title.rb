module Syobocal
  module DB
    module Object

      class Title
        extend XMLMapper 
        map attr: :title,                xpath: "Title"
        map attr: :first_year,           xpath: "FirstYear",     type: :int
        map attr: :first_month,          xpath: "FirstMonth",    type: :int
        map attr: :first_finished_year,  xpath: "FirstEndYear",  type: :int
        map attr: :first_finished_month, xpath: "FirstEndMonth", type: :int
        map attr: :subtitles_raw,        xpath: "SubTitles"
        map attr: :category,             xpath: "Cat",           type: :int

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
