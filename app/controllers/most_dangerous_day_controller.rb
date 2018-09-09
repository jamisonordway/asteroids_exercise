class MostDangerousDayController < ApplicationController

      def index
        start_date = params[:start_date]
        end_date = params[:end_date]
        @dangerous_day_result = DangerousDayFinder.new(start_date, end_date).find_day
      end

    # @date_range = JSON.parse(response.body, symbolize_names: true)

    # results = JSON.parse(response.body, symbolize_names: true)[:results]
  
    # @asteroids  = results.map do |result|
    #    Asteroid.new(result)
    # end
end 