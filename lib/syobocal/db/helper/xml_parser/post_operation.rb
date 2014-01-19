module Syobocal
  module DB
    module Helper
      module XMLParser

        module PostOperation
          class << self
            def int(value)
              value.to_i
            end

            def datetime(value)
              DateTime.strptime(value, "%Y-%m-%d %H:%M:%S")
            end
          end
        end
        
      end
    end
  end
end