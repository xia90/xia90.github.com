require "date"

module Jekyll
  module PhotoFilter
    def photo_filter(files)
      photos = files.select {|photo| photo.relative_path.include?("original") }
      photos.sort_by do |photo|
        Liquid::Template.parse("{{ '#{photo.path}' | git_date }}").render(@context)
      end.reverse
    end
  end
end
Liquid::Template.register_filter(Jekyll::PhotoFilter)