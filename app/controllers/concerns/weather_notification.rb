module WeatherNotification 
   extend ActiveSupport::Concern

   def notification(data)

      temp = data["main"]["temp"]
      wind_speed = data["wind"]["speed"]

      # conditions for temperature notification

      temp_notify = case temp 

                  when -10..5
                     "It's freezing at #{temp}°C. Dress warmly."
                  when 6..15
                     "It's quite cold at #{temp}°C. A jacket is a good idea."
                  when 15..25
                     "It's a bit cool at #{temp}°C. Light layers recommended."
                  when 25..35
                     "It's quite hot at #{temp}°C, Take care."
                  when 35..60
                     "It's extremely hot at #{temp}°C, Stay hydrated."
                  else 
                     "It's normal at #{temp}°C, Enjoy."
                  end 

      # conditions for wind speed notification
    
      wind_notify = wind_speed > 5 ?  "Winds are at #{wind_speed} m/s — stay safe!" 
                  : "Winds are at #{wind_speed} m/s — perfect weather to be outside!"
      

      return "#{temp_notify} #{wind_notify}"
   end

end
