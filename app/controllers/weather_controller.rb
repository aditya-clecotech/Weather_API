class WeatherController < ApplicationController
   include WeatherData

   def index 

      if current_user.present?

         city = current_user.favorite_city || "Indore"
         data = weather(city)

         render json: {
            data: {
               city: current_user.favorite_city,
               temp: data["main"]["temp"],
               temp_min: data["main"]["temp_min"],
               temp_max: data["main"]["temp_max"],
               feels_like: data["main"]["feels_like"],
               weather: data["weather"].first["main"],
               sys: data["sys"]
            }
         }
      else  
         render json: {message: "Please login/signup to continue..."}
      end 

   end 
end


