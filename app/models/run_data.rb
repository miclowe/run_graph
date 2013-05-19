class RunData < ActiveRecord::Base
  # attr_accessible :title, :body

  def get_data
    me = Nike::Client.new(ENV['NIKE_USERNAME'], ENV['NIKE_PASSWORD'])
    activities = me.activities(type: :run)

    # Create month, distance key/value pairs
    runs = {}

    activities.each do |activity|
      date = activity.start_time_utc
      if date.year == Time.now.year
        distance = activity.metrics.distance_in_miles
        month = date.month
        runs[month] ||= 0
        runs[month] += distance
      end
    end

     # Statusboard app requires Array
    data = []
    data = runs.map do |run|
      { :title => Date::MONTHNAMES[run[0]], :value => run[1].round(2) }
    end
    data

  end

end
