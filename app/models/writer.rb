class Writer < ActiveRecord::Base
  attr_accessible :email, :first_name, :gender, :last_name, :screen_name
end
