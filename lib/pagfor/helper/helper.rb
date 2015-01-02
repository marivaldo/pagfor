module Pagfor
  class Helper
    include Pagfor::Filler

    attr_accessor :arquivo

    def string
      arquivo.string
    end

    def save_to_file(file)
      arquivo.save_to_file(file)
    end
  end
end