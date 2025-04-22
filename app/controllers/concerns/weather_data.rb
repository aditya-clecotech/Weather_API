module WeatherData
   extend ActiveSupport::Concern 

   require 'httparty'

   def weather(city)

      response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=bd5e378503939ddaee76f12ad7a97608&units=metric");

      data = JSON.parse(response.body);  
      
      json = {
         city: city,
         temp: data["main"]["temp"],
         temp_min: data["main"]["temp_min"],
         temp_max: data["main"]["temp_max"],
         feels_like: data["main"]["feels_like"],
         weather: data["weather"].first["main"],
         sys: data["sys"]
      }

      return [data, json]
   end
end  