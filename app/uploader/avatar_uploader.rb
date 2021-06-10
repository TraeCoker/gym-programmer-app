class AvatarUploader < CarrierWave::Uploader::Base
    storage :file

    def content_type_allowlist
      [/image\//]
    end
    
  end