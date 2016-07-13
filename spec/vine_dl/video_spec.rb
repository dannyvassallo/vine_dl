require_relative "../spec_helper"

describe VineDl::Video do
  let(:videos) { user.videos }
  let(:user) { VineDl::UserFactory.build }

  it "#user returns an instance of VineDl::User" do
    assert_equal([user], videos.map(&:user).uniq)
  end

  it "#file_name returns a string ending with .mp4" do
    videos.map(&:file_name).each do |file_name|
      assert_match(/[\w-]+\.mp4/, file_name)
    end
  end

  it "#download writes a file to the given local path and returns the local path" do
    videos.each do |video|
      download_path = File.join(SPEC_ROOT_DIR, "tmp", "#{video.file_name}")

      begin
        result_path = video.download(download_path, :create_directory => true)
        assert_equal(download_path, result_path)
        assert(File.exists?(download_path)) if NO_MOCKS
      ensure
        File.unlink(download_path) unless NO_DELETE_DOWNLOADED_FILES || !File.exists?(download_path)
      end
    end
  end

  it "#download raises an Errno::ENOENT exception when dir does not exist and create_directory is not specified" do
    video = videos.first
    download_path = File.join(SPEC_ROOT_DIR, "doesnt_exist", "#{video.file_name}")

    begin
      assert_raises(Errno::ENOENT) do
        video.download(download_path)
      end
    ensure
      File.unlink(download_path) unless NO_DELETE_DOWNLOADED_FILES || !File.exists?(download_path)
    end
  end
end
