require 'diary'
require 'log'
require 'to_do_list'
require 'number_scraper'

RSpec.describe 'integrated' do
	it "add entry" do
		diary = Diary.new
		entry = Log.new('Dear Diary, I ate a pineapple.')
		diary.add(entry)
	end 
	it "read past day" do
		diary = Diary.new
		entry = Log.new('Dear Diary, I ate a pineapple.','01/01/2021')
		entry_2 = Log.new('Dear Diary, I ate a apple.','02/01/2021')
		entry_3 = Log.new('Dear Diary, I ate a peach.','03/01/2021')
		diary.add(entry)
		diary.add(entry_2)
		diary.add(entry_3)
		result = diary.read('02/01/2021')
		expect(result).to eq(entry_2)
	end 
	it "read invalid day" do
		diary = Diary.new
		entry = Log.new('Dear Diary, I ate a pineapple.','01/01/2021')
		diary.add(entry)
		expect{diary.read('01/09/2022')}.to raise_error("No such day.")
	end 

	it "get " do
		diary = Diary.new
		entry = Log.new('Dear Diary, I ate a pineapple.','01/01/2021')
		diary.add(entry)
		expect{diary.read('01/09/2022')}.to raise_error("No such day.")
	end 

	it "select correct day" do
		diary = Diary.new
		entry = Log.new('Dear Diary, I ate a pineapple and it was very pleasant to eat.','01/01/2021')
		entry_2 = Log.new('Dear Diary, I ate a apple.','02/01/2021')
		entry_3 = Log.new('Dear Diary, I slept.','03/01/2021')
		diary.add(entry)
		diary.add(entry_2)
		diary.add(entry_3)
		result = diary.select(2, 5)
		expect(result).to eq(entry_2)
	end 

	it "Give to_do and entry for a day" do
		diary = Diary.new
		list = TodoList.new 
		item_b = Todo.new('Clean door', '01/01/2021')
		item_a = Todo.new('Clean house', '02/01/2021') 
		item_c = Todo.new('Clean self', '03/01/2021')
		list.add(item_a)
		list.add(item_b)
		list.add(item_c)
		entry = Log.new('Dear Diary, I ate a pineapple and it was very pleasant to eat.','01/01/2021')
		entry_2 = Log.new('Dear Diary, I ate a apple.','02/01/2021')
		entry_3 = Log.new('Dear Diary, I slept.','03/01/2021')
		diary.add(entry)
		diary.add(entry_2)
		diary.add(entry_3)
		diary.add_list(list)
		result = diary.past_diary_and_to_do('01/01/2021')
		expect(result).to eq(['Dear Diary, I ate a pineapple and it was very pleasant to eat.', 'Clean door')
	end 
	it "Ask for day that does not exist" do
		diary = Diary.new
		list = TodoList.new 
		item_b = Todo.new('Clean door', '01/01/2021')
		list.add(item_b)
		entry = Log.new('Dear Diary, I ate a pineapple and it was very pleasant to eat.','01/01/2021')
		diary.add(entry)
		diary.add_list(list)
		result = diary.past_diary_and_to_do('02/01/2021')
		expect(result).to eq(1)
	end 
	it "get numbers" do
		diary = Diary.new
		entry = Log.new('Dear Diary, called jane on 07859406769','01/01/2021')
		diary.add(entry)
		numbers = NumberGetter.new(diary)
		results = numbers.extract_numbers
		expect(result).to eq('07859406769')
	end 
end 