module VineDl
  module ClientVideoFactory

    module_function

    def build(data)
      if NO_MOCKS
        Vine::Video.new(data)
      else
        VineDl::ClientVideoMock.new(data)
      end
    end

  end
end
