require 'log'


RSpec.describe Log do
	it "enter new diary entry and check it" do
		entry = Log.new('Dear Diary, I ate a pineapple.','01/01/2021')
		result = entry.read
		expect(result).to eq('Dear Diary, I ate a pineapple.')
	end 
	it "get length of entry" do
		entry = Log.new('Dear Diary, I ate a pineapple.','01/01/2021')
		result = entry.count
		expect(result).to eq(6)
	end 
end 