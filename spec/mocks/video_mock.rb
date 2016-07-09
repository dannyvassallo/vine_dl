module VineDl
  class VideoMock < Video

    def client_video
      VineDl::ClientVideoMock.new({})
    end

    def download(path, options = {})
      raise Errno::ENOENT, "no such file or directory" unless options.fetch(:create_directory, false)
      path
    end

  end
end
