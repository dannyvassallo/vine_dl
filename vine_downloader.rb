require "dotenv"
Dotenv.load
require_relative "./lib/vine_dl"

module VineDl

  module_function

  def login_and_get_videos(username, password)
    user = VineDl::User.new(username, password)
    user.videos.each do |video|
      video.download("#{__dir__}/downloads/#{video.file_name}", :create_directory => true)
    end
  end

end

VineDl.login_and_get_videos(ENV["VINE_USERNAME"], ENV["VINE_PASSWORD"])
