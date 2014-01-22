require 'syobocal/db/object'
require 'syobocal/db/api_request'

module Syobocal
  module DB

    @@api_uri = "http://cal.syoboi.jp/db.php"

    def fetch_titles(tid: nil, lastupdate_from: nil, lastupdate_to: nil)
      # TODO: validation
      params = []
      params << "Command=TitleLookup"
      if tid
        params << "TID=" + comma_separated_str(tid)
      else
        params << "TID=*"
      end

      if lastupdate_from || lastupdate_to
        params << "LastUpdate=" + format_from_to(lastupdate_from, lastupdate_to)
      end

      xml = APIRequest.req(params)

      Object::Title.load(xml)
    end

    def fetch_programs(tid: nil, chid: nil, range_from: nil, range_to: nil, count: nil, lastupdate_from: nil, lastupdate_to: nil, pid: nil)
      # TODO: validation
      params = []
      params << "Command=ProgLookup"
      params << "TID=" + comma_separated_str(tid) if tid
      params << "ChID=" + comma_separated_str(chid) if chid
      params << "Count=" + comma_separated_str(count) if count
      params << "PID=" + comma_separated_str(pid) if pid

      if range_from && range_to
        params << "Range=" + format_from_to(range_from, range_to)
      end

      if lastupdate_from || lastupdate_to
        params << "LastUpdate=" + format_from_to(lastupdate_from, lastupdate_to)
      end

      xml = APIRequest.req(params)

      Object::Program.load(xml)
    end

    def fetch_channels(chid: nil, lastupdate_from: nil, lastupdate_to: nil)
      params = []
      params << "Command=ChLookup"
      params << "ChID=" + comma_separated_str(chid) if chid

      if lastupdate_from || lastupdate_to
        params << "LastUpdate=" + format_from_to(lastupdate_from, lastupdate_to)
      end

      xml = APIRequest.req(params)

      Object::Channel.load(xml)
    end

    def fetch_channel_groups(ch_gid: nil, lastupdate_from: nil, lastupdate_to: nil)
      params = []
      params << "Command=ChGroupLookup"
      params << "ChID=" + comma_separated_str(ch_gid) if ch_gid

      if lastupdate_from || lastupdate_to
        params << "LastUpdate=" + format_from_to(lastupdate_from, lastupdate_to)
      end

      xml = APIRequest.req(params)

      Object::ChannelGroup.load(xml)
    end

    private
    def format_from_to(from, to)
      format_datetime(from) + "-" + format_datetime(to)
    end

    def format_datetime(datetime)
      datetime ? datetime.strftime("%Y%m%d_%H%M%S") : ""
    end

    def comma_separated_str(integer_or_integers)
      if integer_or_integers.is_a? Integer
        return integer_or_integers.to_s
      else
        array = []
        integer_or_integers.each do |i|
          array << i.to_s
        end
        return array.join(",")
      end
    end

  end
end
