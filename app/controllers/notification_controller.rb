class NotificationController < ApplicationController
   include WeatherData
   include WeatherNotification
   def index 
   
      if current_user.present?

         city = params[:city] || current_user.favorite_city || "Indore"
         data = weather(city) #calling weather method to fetch weather of given city
         notification = notification(data[0]) # calling notification method to get notification 

         render json: {
            notification: notification
         }

      else  
         render json: {message: "Please login/signup to continue..."}
      end  
   end
end
