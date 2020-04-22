require "date"

module Jekyll
  module PhotoFilter
    def photo_filter(files)
      photos = files.select {|photo| photo.relative_path.include?("original") }
      photos.sort_by do |photo|
        date = DateTime.parse(`git log --format=%ai "#{photo.path}" | tail -1`).to_date
        print photo.path
        print "\n"
        print date.strftime("%Y-%m-%dT%H:%M:%S.%L%z")
        print "\n\n"
        date
      end
    end
  end
end
Liquid::Template.register_filter(Jekyll::PhotoFilter)