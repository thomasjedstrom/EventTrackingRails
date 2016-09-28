class HomeController < ApplicationController

	def index
		ahoy.track "Viewed Index", title: "Posts page viewed"

		# General Tracking
		@events = Ahoy::Event.group("time::date").select("time::date as date, count(1) as count").map{|k| [k.date, k.count]}
		@index_visits =  Ahoy::Event.all.where(name: "Viewed Index").group_by_hour(:time).count
		@browsers = Visit.all.group(:browser).count
		@locations = Visit.all.group(:country).count
		@device = Visit.all.group(:device_type).count

		# Current User Info
		# @cip = current_visit.ip
		# @creferringdomain = current_visit.referring_domain
		# @csearch = current_visit.search_keyword
		# @cbrowser = current_visit.browser
		# @cos = current_visit.os
		# @cdevice = current_visit.device_type
		# @cscreenheight = current_visit.screen_height
		# @cscreenwidth = current_visit.screen_width
		# @ccountry = current_visit.country
		# @cregion = current_visit.region
		# @ccity = current_visit.city
		# @cpostal = current_visit.postal_code
		# @clat = current_visit.latitude
		# @clong = current_visit.longitude
		# @cvisittime = current_visit.started_at

	end
end