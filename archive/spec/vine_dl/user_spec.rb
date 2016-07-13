require_relative "../spec_helper"

describe VineDl::User do
  let(:user) { VineDl::UserFactory.build }

  it "#videos returns an Array of VineDl::Video instances" do
    assert_equal([true], user.videos.map { |video| video.is_a?(VineDl::Video) }.uniq)
  end
end
