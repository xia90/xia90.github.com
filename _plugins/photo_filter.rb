require "date"

module Jekyll
  module PhotoFilter
    def photo_filter(files)
      photos = files.select {|photo| photo.relative_path.include?("original") }
      photos.sort_by do |photo|
        date_raw = `git log --format=%ai "#{photo.path}" | head -1`
        DateTime.strptime(date_raw, '%Y-%m-%d %H:%M:%S %z')
      end.reverse
    end
  end
end
Liquid::Template.register_filter(Jekyll::PhotoFilter)