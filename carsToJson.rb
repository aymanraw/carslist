require 'json'

open("carbrands.txt") do |cars|
	str = cars.read
	brands = str.split(">")
	puts "------> brands count is:  #{brands.count}"
	
	carsHash = {}
	carsHash[:cars] = []

	brands.each_with_index do |brand, index|
		current_brand, models_all = brand.split(":")
		brand_en, brand_ar = current_brand.split(",")
		bhash = {}
		
		#bhash[:brand] = brand_en
		#bhash[:brandCode] = index

		bhash[:brand] = brand_ar unless brand_ar.nil?
		bhash[:brandCode] = index

		#bhash[:brand_ar] = brand_ar unless brand_ar.nil?
		bhash[:models] = []
		
		unless models_all.nil?
			models_en, models_ar = models_all.split(";")
			models_arr_en = models_en.split(",")
			models_arr_ar = models_ar.split(",")

			#puts models_arr_en
			#carmodel = Carmodel.new
			if models_arr_en.any?
				models_arr_en.each_with_index do |value, index|
					hash = {}
					hash[:model_en] = value
					#hash[:model_ar] = models_arr_ar[index] if models_arr_ar[index]
					
					#puts hash

					bhash[:models] << models_arr_ar[index] if models_arr_ar[index]
					#car.carmodels << Carmodel.create(hash)
				end
			end
		end

		carsHash[:cars] << bhash
		#car.save!
	end

	puts carsHash.to_json
end