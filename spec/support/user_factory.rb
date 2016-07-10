module VineDl
  module UserFactory

    module_function

    def build
      if NO_MOCKS
        VineDl::User.new(ENV["VINE_USERNAME"], ENV["VINE_PASSWORD"])
      else
        VineDl::UserMock.new("mockUsername", "mockPassword")
      end

    end

  end
end
