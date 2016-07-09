require "open-uri"

module VineDl
  class Video

    attr_reader :user

    def initialize(_user, _client_video)
      @user = _user
      @client_video = _client_video
    end

    def download(path, options = {})
      create_directory = options.fetch(:create_directory, false)
      # TODO: Find the dir more robustly.
      directory = File.join(path.split("/")[0..-2])

      if create_directory && !File.directory?(directory)
        Dir.mkdir(directory)
      end

      File.open(path, "wb") do |write_stream|
        open(video_url, "rb") do |read_stream|
          write_stream.write(read_stream.read)
        end
      end

      path
    end

    def video_url
      # TODO: Get the url without the query more robustly.
      @video_url ||= client_video.videoUrl.split("?")[0]
    end

    def file_name
      # TODO: Get the video name more robustly.
      @file_name ||= video_url.split("videos_h264high/")[1]
    end

    private

    attr_reader :client_video

  end
end
