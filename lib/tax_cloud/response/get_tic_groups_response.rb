module TaxCloud
  class GetTICGroupsResponse < ResponseBase

    require 'tax_cloud/tic_group'

    attr_accessor :tic_groups

    def initialize(attrs = {})
      attrs.each do |sym, val|
        self.send "#{sym}=", val
      end
      super
    end

    def get_tic_groups
      groups = []
      tic_groups[:tic_group].each do |group|
        tic_group = TaxCloud::TICGroup.new(group)
        groups << tic_group
      end
      groups
    end
  end


end