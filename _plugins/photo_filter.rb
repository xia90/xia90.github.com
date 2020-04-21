require "exifr"

module Jekyll
  module PhotoFilter
    def photo_filter(files)
      photos = files.select {|photo| photo.relative_path.include?("original") }
      photos.sort_by do |photo|
        File.mtime(photo.path)
        # EXIFR::JPEG.new(photo.path).date_time.to_s
      end
    end
  end
end
Liquid::Template.register_filter(Jekyll::PhotoFilter)