module Pagfor
  module DefaultMixin

    def initialize_instance
      super
      Pagfor.defaults.each do |k, v|
        if self.respond_to?("#{k}=")
          self.send("#{k}=", v)
        end
      end
      yield self if block_given?
    end

  end
end