require_relative 'log'
require_relative 'to_do'
require_relative 'to_do_list'
require_relative 'diary'

class NumberExtractor
	def initialize(diary)
		@diary = diary 
	end 
	def extract_numbers
		numbers = []

		return @diary.entries.map do |x|
			x.read.scan(/07[0-9]{9}/)
		end 
		
	end
end