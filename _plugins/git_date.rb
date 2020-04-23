require "date"

module Jekyll
  module GitDate
    def git_date(path)
      date_raw = `git log --format=%ai "#{path}" | head -1`
      DateTime.strptime(date_raw, '%Y-%m-%d %H:%M:%S %z')
    end
  end
end
Liquid::Template.register_filter(Jekyll::GitDate)