class HelperServices
  KELVIN = 273.15

  def initialize
  end

  def invoke
    conn = Faraday.new(:url => 'http://api.openweathermap.org') do |faraday|
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get '/data/2.5/weather', { q: 'Kiev', APPID: ENV['WEATHER_API_KEY']}

    body = JSON.parse(response.body)

    Observation.create(
      {
        temp:      (body['main']['temp'] - KELVIN),
        temp_min:  (body['main']['temp_min'] - KELVIN),
        temp_max:  (body['main']['temp_max'] - KELVIN),
        humidity:  (body['main']['humidity']),
        pressure:  (body['main']['pressure'])
      }
    )
  end

  def self.invoke(*args)
    new(*args).invoke
  end
end