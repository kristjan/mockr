Cloudinary.config do |config|
  config.cloud_name = 'mockr'
  config.api_key    = ENV['CLOUDINARY_API_KEY']
  config.api_secret = ENV['CLOUDINARY_API_SECRET']

  config.enhance_image_tag    = true
  config.cdn_subdomain        = true
  config.static_image_support = Rails.env.production?
end
