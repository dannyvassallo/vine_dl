module VineDl
  class ClientMock < ::Vine::Client

    def initialize(username, password)
      # Do nothing.
    end

    def user_info
      {
        :twitterId => "mockTwitterId"
      }
    end

  end
end
