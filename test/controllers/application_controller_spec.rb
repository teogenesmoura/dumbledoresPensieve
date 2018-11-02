require 'test_helper'

class ApplicationControllerTest < ActiveSupport::TestCase
  test "should return a valid IP address" do
    controller.request.remote_ip = '127.0.0.1'
    assert_equal get_real_ip, '189.6.22.151'
  end

  test 'get_weather_for_city returns a valid weather' do
    info =  get_weather_for_city("London")
    assert_not_nil(info)
    assert(info[0]['name'], 'London')
  end

  # tried testing with 'Narnia'. Apparently, there is a city called Narnia in Bangladesh. Unexpected.
  test 'get_weather_for_city with invalid city return error message' do
  	info = get_weather_for_city("Hogsmead")
  	assert_equal info, "Couldn't find city"
  end

  test 'get_weather_for_latitude_longitude' do 
  	info = get_weather_for_latitude_longitude
  	assert_not_equal info, "Climate couldn't be determined: Lack of information"
  	assert_not_empty info
  end

  test 'get_latitude_longitude_for_ip' do 
  	lat,long = get_latitude_longitude_for_ip
  	assert_not_empty info
  	assert_kind_of(Float,lat)
  	assert_kind_of(Float,long)
  end

  test 'get_city_for_ip' do 
  	city = get_city_for_ip
  	assert_not_empty city
  	assert_not_equal city, "City not found"
  end 

  
end