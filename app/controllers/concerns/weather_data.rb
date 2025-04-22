module WeatherData
   extend ActiveSupport::Concern 

   require 'httparty'

   def weather(city)

      response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=bd5e378503939ddaee76f12ad7a97608&units=metric");

      return JSON.parse(response.body);  
   end
end  