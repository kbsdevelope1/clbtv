class RhbsController < ApplicationController
#   def index

# a = RestClient.get 'http://a98952108bd50135ea8c543d7edaf0a0.scheduler.vidibus.net/api/channels/5aa6722c1d0a7e7578e21c1d/playlist.json'
  	
#  parse_data = JSON.parse(a);
#   schedules = parse_data["playlist"]["schedule"]
#   assets = parse_data["playlist"]["sources"]
#     filtered_schedules = schedules.select { |a| a["starts_at"].between?("2018-06-11T12:25:45Z", "2018-06-24T16:01:21Z")}
#     filtered_schedules.each do |child|  
#       child["url"] = assets.select{|a| a["id"] == child["asset"]}[0]["url"]
# 	 end
#   render json: filtered_schedules

#   end

end
