class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	after_filter :ahoy_track
	after_filter :set_header_for_iframe

	private
	def set_header_for_iframe
		response.headers.delete "X-Frame-Options" 
	end

	protected
	def ahoy_track
		ahoy.track_visit
	end

end
