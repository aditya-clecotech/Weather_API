class NotificationController < ApplicationController
   include WeatherData
   include WeatherNotification
   def index 
   
      if current_user.present?

         city = params[:city] || current_user.favorite_city || "Indore"
         data = weather(city)
         notification = notification(data)

         render json: {
            notification: notification
         }

      else  
         render json: {message: "Please login/signup to continue..."}
      end  
   end
end
