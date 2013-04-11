class Alderman < ActiveRecord::Base

	attr_acessible :name, :party
	has_many :expenses
	
end
