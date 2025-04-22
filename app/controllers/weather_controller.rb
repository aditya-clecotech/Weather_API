class WeatherController < ApplicationController
   include WeatherData

   def index 

      if current_user.present?

         city = current_user.favorite_city || "Indore"
         data = weather(city)

         render json: {
            data: data[1]
         }
      else  
         render json: {message: "Please login/signup to continue..."}
      end 

   end 
end


