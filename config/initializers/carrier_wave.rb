if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

  # Load uploaders
  Dir[File.join(%W[#{Rails.root} app uploaders *])].each do |uploader|
    require uploader
  end

  # use different dirs when testing
  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        File.join(%W[#{Rails.root} tmp spec uploads])
      end

      def store_dir
        File.join(%W[
          #{Rails.root}
          tmp spec uploads
          #{model.class.to_s.underscore}
          #{model.id}
        ])
      end
    end
  end
end
