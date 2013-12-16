module MockSpecHelper

  IMAGE_PATHS = Dir[File.join(%W[#{Rails.root} spec fixtures images *])]

  def self.random_image_file
    Rack::Test::UploadedFile.new(
      File.open(IMAGE_PATHS.sample)
    )
  end

end
