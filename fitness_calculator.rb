def usage(error = nil)

	instructions = "Jackson and Pollock Equation\n
	See source for measuring instructions: http://www.topendsports.com/testing/density-jackson-pollock.htm
	You only need $3 calipers from EBay.
	Women measure triceps, suprailiac, and thigh.
	Men measure chest, abdominal, and thigh.
	Enter a Y if you are a dude, otherwise enter N, your age, and your three measurements\n
	Example: Y,27,8,14,14 "

	puts instructions 

end

usage

body_attributes = gets.chomp.split(",")
gender = body_attributes.shift
age = body_attributes.shift.to_f
sum = body_attributes.map(&:to_i).inject{|sum,x| sum + x }.to_f

if  gender == "Y" 
	x = [1.1093800,0.0008267,0.0000016,0.0002574] #Males
else 
	x = [1.0994921,0.0009929,0.0000023,0.0001392] #Females
end


body_density = x[0] - (x[1] * sum) + (x[2] * (sum**2)) - (x[3] * age)
siri_body_fat = ((495 / body_density) - 450)
brozek_body_fat = ((457 / body_density) - 414.2)

puts "Body Density: #{body_density.round(6)}\tBody Fat (Siri Method): #{siri_body_fat.round(2)}%\tBody Fat (Brozek Method): #{brozek_body_fat.round(2)}%"

