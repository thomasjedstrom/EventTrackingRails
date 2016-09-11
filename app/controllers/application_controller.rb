class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	after_filter :ahoy_track

	protected

	def ahoy_track
	ahoy.track_visit
	end

end
