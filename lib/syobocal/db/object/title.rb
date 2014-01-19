module Syobocal
  module DB
    module Object

      class Title < Base
        attr_reader :title, :subtitles, :first_year, :first_month, :first_finished_year, :first_finished_month

        @mappings = [
          [:@title, "Title"],
          [:@first_year, "FirstYear", :int],
          [:@first_month, "FirstMonth", :int],
          [:@first_finished_year, "FirstEndYear", :int],
          [:@first_finished_month, "FirstEndMonth", :int],
          [:@subtitles_raw, "SubTitles"],
          [:@category, "Cat", :int]
        ].freeze

        @path_to_elements = "TitleLookupResponse/TitleItems/TitleItem".freeze

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