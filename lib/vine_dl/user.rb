require "vine_client"

module VineDl
  class User

    attr_reader :username, :password

    def initialize(_username, _password)
      @username = _username
      @password = _password
    end

    def videos
      @videos ||= timeline.records.map { |client_video| Video.new(self, client_video) }
    end

    def timeline
      @timeline ||= client.timelines(twitter_id)
    end

    def twitter_id
      @twitter_id ||= client.user_info.fetch(:twitterId)
    end

    private

    def client
      @client ||= ::Vine::Client.new(username, password)
    end

  end
end
