class User < ActiveRecord::Base

validates_presence_of :username, :message => "You must enter a username."
validates_confirmation_of :password, :message => "Password cannot be blank"
validates_presence_of :password, :on => :create

end
