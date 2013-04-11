require 'csv'


class CsvReader
	def initialize
		@line = []
	end	

	def read_in_csv_data(csv_file_name)
		CSV.foreach(csv_file_name, headers: true) do |row|
			@line << VirtualExpense.new(row["VEREADORES"],row["Descricao"] ,row["Ano"],row["Janeiro"],row["Fevereiro"],row["Marco"],row["Abril"],row["Maio"],row["Junho"],row["Julho"],row["Agosto"],row["Setembro"],row["Outubro"],row["Novembro"],row["Dezembro"])
		end
		@line.each do |expense|
			alderman = Alderman.where(:name => expense.name).first 

			expense.jan = to_save(expense.jan)
			expense.fev = to_save(expense.fev)
			expense.mar = to_save(expense.mar)
			expense.abr = to_save(expense.abr)
			expense.mai = to_save(expense.mai)
			expense.jun = to_save(expense.jun)
			expense.jul = to_save(expense.jul)
			expense.ago = to_save(expense.ago)
			expense.set = to_save(expense.set)
			expense.out = to_save(expense.out)
			expense.nov = to_save(expense.nov)
			expense.dez = to_save(expense.dez)

			bd_expense = Expense.create(
				:description => expense.description
				:year => expense.year,
				:jan => expense.jan,
				:fev => expense.fev,
				:mar => expense.mar,
				:abr => expense.abr,
				:mai => expense.mai,
				:jun => expense.jun,
				:jul => expense.jul,
				:ago => expense.ago,
				:set => expense.set,
				:out => expense.out,
				:nov => expense.nov,
				:dez => expense.dez
			)

			alderman.expenses << bd_expense
			alderman.save
		end
	end

	def read_in_csv_politicians(csv_file_name)
		@line << Alderman.new(row["VEREADORES"],row["Partido"])

		@line.each do |alderman|
			alderman.save
		end
	end
	def self.to_save(value)
		r = value.match(/(\d+[,]\d+)/)[1]
		r = r.to_f
	end

end

	#reader = CsvReader.new

	#ARGV.each do |csv_file_name|
	#	reader.read_in_csv_data(csv_file_name)
	#end
