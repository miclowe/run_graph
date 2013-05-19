class RunData < ActiveRecord::Base
  # attr_accessible :title, :body

  def get_data
    me = Nike::Client.new(ENV['NIKE_USERNAME'], ENV['NIKE_PASSWORD'])
    activities = me.activities(type: :run)
  end

end
