namespace :db do
	desc "Sample writers"
	task populate: :environment do
		admin = Writer.create!(first_name: "Akash",
													 last_name: "Khandelwal",
													 email: "er.akashkhandelwal@gmail.com",
													 screen_name: "sample_screen",
													 gender: "male")
		admin.toggle!(:admin)
		10.times do |n|
	    first_name  = Faker::Name.name
	    last_name = Faker::Name.name
	    email = "example-#{n+1}@writerapp.org"
	    password  = "password"
	    gender = "male"
	    screen_name = "sample_screen #{n+1}"
	    Writer.create!(first_name: first_name,
	    						 last_name: last_name,
	                 email: email,
	                 gender: gender,
	                 screen_name: screen_name)
	  end
	end
end