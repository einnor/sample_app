#require "factory_girl"

#Factory.define :user do |user|
	#user.name										"Ronnie Nyaga"
	#user.email									"rnafundi@gmail.com"
	#user.password								"foobar"
	#user.password_confirmation	"foobar"
#end

FactoryGirl.define do
	factory :user do
		name										"Ronnie Nyaga"
		email									"rnafundi@gmail.com"
		password								"foobar"
		password_confirmation	"foobar"
	end
end
