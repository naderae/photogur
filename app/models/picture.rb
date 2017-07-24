class Picture < ApplicationRecord

def self.older_pictures
  Picture.where("created_at < ?", Date.current.prev_month)
end

def self.pictures_created_in_year(year)
  start_date = Date.new(year, 1, 1)
  end_date = Date.new(year, 12, 31)
  Picture.where("created_at > ? and created_at <" start_date, end_date)
end
