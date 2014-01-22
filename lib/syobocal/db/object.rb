require 'xmlmapper'
require 'syobocal/db/object/title'
require 'syobocal/db/object/program'
require 'syobocal/db/object/channel'
require 'syobocal/db/object/channel_group'

module ::XMLMapper::Types
  def datetime(str)
    DateTime.parse(str + " JST")
  end
end
