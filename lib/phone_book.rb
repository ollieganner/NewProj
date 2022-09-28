require_relative 'log'
require_relative 'to_do'
require_relative 'to_do_list'
require_relative 'diary'

class PhoneBook
	def initialize(diary)
		@diary = diary
		@phone_numbers = []
	end 
	def extract_numbers
		@phone_numbers << @diary.entries.map do |x|
			x.read.scan(/07[0-9]{9}/)
		end 
		@phone_numbers
	end
end