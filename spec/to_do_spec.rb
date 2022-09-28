require 'to_do'

RSpec.describe Todo do
	it "add entry" do
		list_a = Todo.new('Clean dog', '01/01/2021') 
		result = list_a.read 
		expect(result).to eq('Clean dog')
	end 
	it "mark_done" do
		list_a = Todo.new('Clean dog', '01/01/2021') 
		list_a.mark_done
		result = list_a.done
		expect(result).to eq true 
	end 
end 