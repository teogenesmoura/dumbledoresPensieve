require 'test_helper'

class MemoryListTest < ActiveSupport::TestCase
  test "create new empty memory list" do
  	last = MemoryList.order("created_at").last
  	mem = MemoryList.new
  	mem.save!
  	assert_not_equal last.id, mem.id
  end

  test "create new memory list with parameters" do 
  	mem = MemoryList.new(title: "Test Memory List", description: "Test Memory list description")
  	mem.save!
  	last = MemoryList.order("created_at").last
  	assert_equal mem.title, last.title
  end

  context "associations" do 
  	should have_many(:memory_items)
  end
end
