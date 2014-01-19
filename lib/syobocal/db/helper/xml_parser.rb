require 'syobocal/db/helper/xml_parser/post_operation'

module Syobocal
  module DB
    module Helper

      module XMLParser
        def parse_xml(xml)
          objs = []
          xml.xpath(path_to_elements).each do |node|
            obj = self.new
            XMLParser.set_attrs(obj, node, mappings)
            objs << obj
          end
          objs
        end

        class << self
          def extract_xml(node, name)
            node.xpath(name).text
          end

          def set_attrs(obj, node, mappings)
            mappings.each do |mapping|
              variable_name = mapping[0]
              elem_name = mapping[1]
              value = extract_xml(node, elem_name)

              if operation = mapping[2]
                value = PostOperation.send(operation, value)
              end

              obj.instance_variable_set(variable_name, value)
            end
          end
        end
      end

    end
  end
end