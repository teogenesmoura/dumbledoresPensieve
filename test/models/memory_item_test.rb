require 'test_helper'

class MemoryItemTest < ActiveSupport::TestCase
  test "create new Memory item" do
	mem = MemoryItem.new(content: "Test memory", location: "test location", weather: "test_weather")
	mem.save!
	assert_equal "Test memory", mem.content
	assert_not_empty mem.location 	
  end

  test "create empty Memory item" do
  	mem = MemoryItem.new
  	mem.valid?
  	mem.errors[:content].should include("can't be blank")
  end
end
