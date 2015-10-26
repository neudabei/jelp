module ApplicationHelper

  def ctime_ago_in_words(time_str)
    time = time_str.to_time + (-Time.zone_offset(Time.now.zone))
    "#{time_ago_in_words(time)} ago"
  end

  def review_average(business)
    stars_sum = 0
    business.reviews.each do |review|
      stars_sum += review.stars
    end
    business.reviews.count > 0 ? (stars_sum / business.reviews.count) : 0
  end

end
