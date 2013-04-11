class Expense < ActiveRecord::Base
	belongs_to :alderman

	attr_reader :description,:year,:jan,:fev,:mar,:abr,:mai,:jun,:jul,:ago,:set,:out,:nov,:dez 

	def initialize(description,year,jan,fev,mar,abr,mai,jun,jul,ago,set,out,nov,dez)
		 @description = description
		 @year = year
		 @jan = jan
		 @fev = fev
		 @mar = mar
		 @abr = abr
		 @mai = mai
		 @jun = jun
		 @jul = jul
		 @ago = ago
		 @set = set
		 @out = out
		 @nov = nov
		 @dez = dez
	end
end