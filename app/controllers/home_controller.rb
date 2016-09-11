class HomeController < ApplicationController

	def index
	    ahoy.track "Viewed Index", title: "Posts page viewed"

	    @events = Ahoy::Event.group("time::date").select("time::date as date, count(1) as count").map{|k| [k.date, k.count]}
	    @index_visits =  Ahoy::Event.all.where(name: "Viewed Index").group_by_hour(:time).count
	    @browsers = Visit.all.group(:browser).count
	    @locations = Visit.all.group(:country).count
	    @device = Visit.all.group(:device_type).count
	end
end
