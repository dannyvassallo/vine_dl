require "vine_dl/version"
require_relative "vine_dl/user"
require_relative "vine_dl/video"

module VineDl

  module_function

  def login_and_get_videos(username, password)
    user = VineDl::User.new(username, password)
    user.videos.each do |video|
      video.download("#{__dir__}/downloads/#{video.file_name}", :create_directory => true)
    end
  end

end
