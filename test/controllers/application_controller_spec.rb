require 'test_helper'

class ApplicationControllerTest < ActiveSupport::TestCase
	describe ApplicationController do
		describe "get_real_ip" do
			it "returns '189.6.22.151'"  do 
				expect(subject.get_real_ip(request.env['REMOTE_ADDR'] = '127.0.0.1')).to eq("189.6.22.151")
		end
end