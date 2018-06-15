# file: app/controller/api/v1/sessions_controller.rb
class Api::V1::EpgController < ApplicationController
  
  def get_epg
    url = "http://..."
    resp = Net::HTTP.get_response(URI.parse("http://a98952108bd50135ea8c543d7edaf0a0.scheduler.vidibus.net/api/channels/5aa6722c1d0a7e7578e21c1d/playlist.json"))
    data = JSON.parse(resp.body)
    start_date = "2018-06-11T12:25:45Z"  # prams[:start_date]
    end_date = "2018-06-16T16:01:21Z"    # prams[:end_date]
      filtered_schedules = playlists(data,start_date,end_date)     
      if filtered_schedules.empty?
        render json: { status:"success",message: "No data found" } 
      else
        render json: { status:"success",data:filtered_schedules}       
      end
    end

   private
    def playlists(data,start_date,end_date)
      schedules = data["playlist"]["schedule"]
      assets = data["playlist"]["sources"]
      binding.pry
      filtered_schedules = schedules.select { |a| a["starts_at"].between?(start_date, end_date)}
      filtered_schedules.each do |child|
        child["url"] = child["source"]? assets.select{|a|  a["id"] == child["source"]}[0]["url"] :nil
        child.except!("id","asset","source")

      end
    end




end