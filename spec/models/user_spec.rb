# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
      :name => "Example User",
      :username => "Exampleuser",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end


   
  
end

