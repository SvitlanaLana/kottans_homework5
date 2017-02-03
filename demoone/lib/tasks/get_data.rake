desc 'Get the current weather'
task update_weather: :environment do
  HelperServices.invoke
end