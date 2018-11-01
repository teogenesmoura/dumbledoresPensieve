require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  # setup do
  #   @product = products(:bacon)
  # end

  test '#get_real_ip returns an IP' do
    @request.env['REMOTE_ADDR'] == '127.0.0.1'
    assert_equal get_real_ip, '189.6.22.151'
  end

  # test 'get_weather_for_city returns a valid weather' do
  #   info =  get_weather_for_city("London")
  #   assert_not_nil(info)
  #   # assert(info[0]['name'], 'London')
  # end



  # test '#product_list_entry contains a thumbnail image' do
  #   image_regexp = /src="#{ @product.image.url(:thumbnail) }"/
  #   assert_match image_regexp, product_list_entry(@product)
  # end

  # test '#product_list_entry contains the product name' do
  #   assert_match /#{ @product.name }/, product_list_entry(@product)
  # end

  # test '#product_list_entry contains the product price' do
  #   assert_match /\$#{ @product.price }/, product_list_entry(@product)
  # end
end