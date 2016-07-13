module VineDl
  class UserMock < User

    def new(username = ENV["VINE_USERNAME"], password = ENV["VINE_PASSWORD"])
      super
    end

    def videos
      (0..rand(1..10)).map { |i| VineDl::VideoFactory.build(self, VineDl::ClientVideoMock.new({})) }
    end

    def client
      ClientMock.new(username, password)
    end

  end
end
