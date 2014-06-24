class Movie < ActiveRecord::Base
  def flop?
    total_gross.blank? || total_gross < 50_000_000
  end

  def self.released
    where("released_on <= ?", Time.now).order(released_on: :desc)
  end

  def self.hit
    hit_gross = 300_000_000
    where("total_gross >= ?", hit_gross).order(total_gross: :desc)
  end

  def self.flop
    flop_gross = 50_000_000
    where("total_gross <= ?", flop_gross).order(total_gross: :asc)
  end

  def self.recently_added
    # only want the three movies with the latest created_on dates
    order(created_at: :desc).limit(3)
  end
end
