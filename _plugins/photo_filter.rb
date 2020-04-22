require "exifr"

module Jekyll
  module PhotoFilter
    def photo_filter(files)
      photos = files.select {|photo| photo.relative_path.include?("original") }
      photos.sort_by do |photo|
        print photo.path
        print "\n"
        print File.mtime(photo.path)
        print "\n"
        print "----\n"
        File.mtime(photo.path)
        # EXIFR::JPEG.new(photo.path).date_time.to_s
      end
    end
  end
end
Liquid::Template.register_filter(Jekyll::PhotoFilter)