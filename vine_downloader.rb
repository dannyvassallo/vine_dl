require "open-uri"
require "vine_client"
require "dotenv"
Dotenv.load

module VineDownloader

  def self.login_and_get_videos(username, password)
    user = Vine::Client.new(username, password);
    info = user.user_info
    user_id = info[:twitterId]
    timeline = user.timelines(user_id)
    videos = timeline.records
    iterate_through_videos(videos)
  end

  def self.iterate_through_videos(videos)
    videos.each do |video|
      video_url = video.videoUrl.split("?")[0]
      video_name = video_url.split("videos_h264high/")[1]
      puts video_url
      puts video_name
      download_vine(video_url, video_name, "./downloads/")
    end
  end


  def self.download_vine(video_url, video_name, directory)
    directory_exists?(directory)
    File.open("#{directory}/#{video_name}", "wb") do |saved_file|
      # the following "open" is provided by open-uri
      open(video_url, "rb") do |read_file|
        saved_file.write(read_file.read)
      end
    end
  end

  def self.directory_exists?(directory)
    unless File.directory?(directory)
      Dir.mkdir directory
    end
  end

end

VineDownloader.login_and_get_videos(ENV["VINE_USERNAME"], ENV["VINE_PASSWORD"])
