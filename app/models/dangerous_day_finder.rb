class DangerousDayFinder
    attr_reader :start_date, :end_date

    def initialize(start_date, end_date)
        @start_date = start_date
        @end_date = end_date
    end

    def find_day
      conn = Faraday.new(:url => "https://api.nasa.gov") do |faraday|
        faraday.headers["X-API-KEY"] = ENV['nasa_key']
        faraday.adapter Faraday.default_adapter
    end 
    start_date = DateTime.parse(@start_date).strftime('%F')
    end_date = DateTime.parse(@end_date).strftime('%F')
    response = conn.get "/neo/rest/v1/feed?start_date=#{start_date}&end_date=#{end_date}"
      data = JSON.parse(response.body, symbolize_names: true)
      # binding.pry
      days = data[:near_earth_objects].each do |date, info|
      end
      days.each do |key, value|
        name = value.first[:name]
        object_id = value.first[:neo_reference_id]
        # binding.pry
        NearEarthObject.new(name, object_id)
      end
    end
end