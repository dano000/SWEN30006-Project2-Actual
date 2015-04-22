require 'nokogiri'
require 'open-uri'
require 'date'

class Scrape
################## CONSTANTS AND VARS USED THROUGHOUT #########################

  BASE_BOM = 'http://www.bom.gov.au'
  MEL_WEATHER = 'vic/observations/melbourne.shtml'

  API_KEY = 'a3df59710af62078ae232f3a8184fbe1'
  BASE_FIO = 'https://api.forecast.io/forecast/'

  doc = Nokogiri::HTML(open("#{BASE_BOM}/#{MEL_WEATHER}"))
  data = doc.css('#tMELBOURNE tbody')

  @rows = data[0].css('tr') # Rows for the corresponding observation stations
  @names = @rows.xpath('//th/a') # The names of all observation stations

###############################################################################

################ Sanitise the input from BOM Data #############################

  def self.sanitize(input)
    (input == "-") ? nil : input
  end
################ Return the current forecast from Forecast.io #################
  def self.update_forecast(lat, long,station_id)
    lat_long = (lat.to_s+","+long.to_s).to_s
    forecast = JSON.parse(open("#{BASE_FIO}#{API_KEY}/#{lat_long}?units=ca").read)
    f_datetime = DateTime.strptime(forecast['currently']['time'].to_s,'%s')

    f_precip = forecast['currently']['precipIntensity'] * 24 # Convert precipitation/hour to per day
    f_temp = forecast['currently']['temperature']
    f_dewpoint = forecast['currently']['dewPoint']
    f_winddir = bearing_to_dir(forecast['currently']['windBearing']) # Convert Bearing in Degrees to Cardinal Direction
    f_windspeed = forecast['currently']['windSpeed']


    weather_out = Weather.create(time:f_datetime,station_id:station_id)
    Rainfall.create(current:f_precip,weather_id:weather_out.id)
    Temperature.create(current:f_temp,weather_id:weather_out.id)
    Dewpoint.create(current:f_dewpoint,weather_id:weather_out.id)
    Winddir.create(current:f_winddir,weather_id:weather_out.id)
    Windspeed.create(current:f_windspeed,weather_id:weather_out.id)

  end



  #Source: http://climate.umn.edu/snow_fence/components/winddirectionanddegreeswithouttable3.htm
  def self.bearing_to_dir(wind)
      if (wind > 348.75 and wind <=360) or (wind >= 0 and wind < 11.25)
        return 'N'
      elsif wind >= 11.25 and wind < 33.75
        return 'NNE'
      elsif (wind >= 33.75 and wind < 56.25)
        return 'NE'
      elsif (wind >= 56.25 and wind < 78.75)
        return 'ENE'
      elsif (wind >= 78.75 and wind < 101.25)
        return 'E'
      elsif (wind >= 101.25 and wind < 123.75)
        return 'ESE'
      elsif (wind >= 123.75 and wind < 146.25)
        return 'SE'
      elsif (wind >= 146.25 and wind < 168.75)
        return 'SSE'
      elsif (wind >= 168.75 and wind < 191.25)
        return 'S'
      elsif (wind >= 191.25 and wind < 213.75)
        return 'SSW'
      elsif (wind >= 213.75 and wind < 236.25)
        return 'SW'
      elsif (wind >= 236.25 and wind < 258.75)
        return 'WSW'
      elsif (wind >= 258.75 and wind < 281.25)
        return 'W'
      elsif (wind >= 281.25 and wind < 303.75)
        return 'WNW'
      elsif (wind >= 303.75 and wind < 326.25)
        return 'NW'
      elsif (wind >= 326.25 and wind <= 348.75)
        return 'NNW'
      end


  end

###### Scrape Stations for the first time and initial data ####################

  def self.new

    forecasts = Array.new
    stations = Array.new

    @rows.each { |row|
      # Station Data
      current_station_uri = row.css('@href').text
      cur_station_t = Nokogiri::HTML(open("#{BASE_BOM}#{current_station_uri}")).css('table.stationdetails').xpath('tr/td')
      name = row.css('/th/a').text
      lat = /\-?[0-9.]+/.match(cur_station_t[3]).to_s # Latitude
      long = /\-?[0-9.]+/.match(cur_station_t[4]).to_s # Longitude

      # Bureau Data
      b_rainfall = sanitize(row.xpath('td')[2].text)
      b_temp = sanitize(row.xpath('td')[1].text)
      b_dewpoint = sanitize(row.xpath('td')[3].text)
      b_winddir = sanitize(row.xpath('td')[6].text)
      b_windspeed = sanitize(row.xpath('td')[7].text)
      b_datetime = DateTime.parse((row.xpath('td')[0].text)+'+10')

      if Station.find_by_name(name) == nil
        i = Station.create(name:name,lat:lat,long:long)
      else
        i = Station.find_by_name(name)
      end

      update_bureau_row(name,b_rainfall,b_temp,b_dewpoint,b_winddir,b_windspeed,b_datetime)
    }

  end

###### Scrape current data from the BoM Site ##################################

  def self.update_bureau_row(name,b_rainfall,b_temp,b_dewpoint,b_winddir,b_windspeed,b_datetime)

    current_station = Station.find_by_name(name)
    weather_out = Weather.create(time:b_datetime,station_id:current_station.id)
    Rainfall.create(current:b_rainfall,weather_id:weather_out.id)
    Temperature.create(current:b_temp,weather_id:weather_out.id)
    Dewpoint.create(current:b_dewpoint,weather_id:weather_out.id)
    Winddir.create(current:b_winddir,weather_id:weather_out.id)
    Windspeed.create(current:b_windspeed,weather_id:weather_out.id)
  end


  def self.new_fio
   Station.all.each do |i|
     update_forecast(i.lat,i.long,i.id)
   end

  end


end