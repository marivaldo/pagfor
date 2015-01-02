module Pagfor
  module Filler

    def fill(hash, *objects)
      objects.each do |object|
        hash.each do |k, v|
          object.send("#{k}=", v) if object.respond_to?("#{k}=")
        end
      end
    end

    def fill!(hash, *objects)
      objects.each do |object|
        hash.each do |k, v|
          object.send("#{k}=", v)
        end
      end
    end

  end
end