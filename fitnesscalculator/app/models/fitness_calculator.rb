class FitnessCalculator
	attr_reader :attributes
	
	def initialize(attributes)
		@gender, @age, @chest_triceps, @suprailiac_abdominal, @thigh = attributes
	end
	
	def determine_gender_variable
		if  @gender == "M" 
			[1.1093800,0.0008267,0.0000016,0.0002574] #Males
		else 
			[1.0994921,0.0009929,0.0000023,0.0001392] #Females
		end
	end

	def body_density
		constants = determine_gender_variable
		sum = @chest_triceps.to_f + @suprailiac_abdominal.to_f + @thigh.to_f
		constants[0] - (constants[1] * sum) + (constants[2] * (sum**2)) - (constants[3] * @age.to_f)
	end

	def siri_body_fat
		((495 / body_density) - 450)
	end

	def brozek_body_fat
		((457 / body_density) - 414.2)
	end

end

gender, age, chest_triceps, suprailiac_abdominal, thigh = ARGV

def usage(error = nil)

	puts error unless error.nil?
	puts "Jackson and Pollock Equation

	See source for measuring instructions: http://www-rohan.sdsu.edu/~ens304l/skinfold.htm
	You only need $3 calipers from EBay.
	Women measure triceps, suprailiac, and thigh.
	Men measure chest, abdominal, and thigh.

	Usage: ruby fitness_calculator.rb [gender] [age] [chest|triceps] [suprailiac|abdominal] [thigh] 

	Example: ruby fitness_calculator.rb M 27 8 14 14
	"

end

if ARGV.count != 5
	usage
else
	fitness_calculator = FitnessCalculator.new(ARGV)
	puts "Body Density: #{fitness_calculator.body_density.round(6)}\tBody Fat (Siri Method): #{fitness_calculator.siri_body_fat.round(2)}%\tBody Fat (Brozek Method): #{fitness_calculator.brozek_body_fat.round(2)}%"
end
