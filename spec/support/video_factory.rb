module VineDl
  module VideoFactory

    module_function

    def build(user, client_video)
      if NO_MOCKS
        VineDl::Video.new(user, client_video)
      else
        VineDl::VideoMock.new(user, client_video)
      end
    end

  end
end
