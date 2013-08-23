def usage(error = nil)

puts error unless error.nil?
puts "Jackson and Pollock Equation

See source for measuring instructions: http://www-rohan.sdsu.edu/~ens304l/skinfold.htm
You only need $3 calipers from EBay.
Women measure triceps, suprailiac, and thigh.
Men measure chest, abdominal, and thigh.

Usage: ruby fitness_calculator.rb [gender] [chest|triceps] [suprailiac|abdominal] [thigh] 

Example: ruby fitness_calculator.rb M 27 8 14 14
"

end

gender = ARGV[0]
age = ARGV[1]
chest_triceps = ARGV[2]
suprailiac_abdominal = ARGV[3]
thigh = ARGV[4]

if ARGV.empty?
	usage

else

	sum = chest_triceps.to_f + suprailiac_abdominal.to_f + thigh.to_f

	if  gender == "M" 
		x = [1.1093800,0.0008267,0.0000016,0.0002574] #Males
	else 
		x = [1.0994921,0.0009929,0.0000023,0.0001392] #Females
	end

	body_density = x[0] - (x[1] * sum) + (x[2] * (sum**2)) - (x[3] * age)
	siri_body_fat = ((495 / body_density) - 450)
	brozek_body_fat = ((457 / body_density) - 414.2)

	puts "Body Density: #{body_density.round(6)}\tBody Fat (Siri Method): #{siri_body_fat.round(2)}%\tBody Fat (Brozek Method): #{brozek_body_fat.round(2)}%"

end