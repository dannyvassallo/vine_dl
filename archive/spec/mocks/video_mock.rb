module VineDl
  class VideoMock < Video

    def client_video
      VineDl::ClientVideoMock.new({})
    end

    private

    def download_and_write_to_stream(write_stream)
      # Do nothing.
    end

  end
end
