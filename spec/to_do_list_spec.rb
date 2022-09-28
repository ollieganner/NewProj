require 'to_do'
require 'to_do_list'

RSpec.describe 'to_do integrated' do
	it "add entries" do
		list = Todo.new('Clean house', '02/01/2021') 
		master = TodoList.new
		master.add(list)
	end 
	it "incomplete list" do
		list_b = Todo.new('Clean house', '02/01/2021') 
		list_c = Todo.new('Clean door', '03/01/2021') 
		list_d = Todo.new('Clean self', '04/01/2021') 
		master = TodoList.new
		master.add(list_b)
		master.add(list_c)
		master.add(list_d)
		list_b.mark_done
		incomplete = master.incomplete
		expect(incomplete).to eq(['Clean door', 'Clean self'])
	end 
	it "complete list" do
		list_b = Todo.new('Clean house', '02/01/2021') 
		list_c = Todo.new('Clean door', '03/01/2021') 
		list_d = Todo.new('Clean self', '04/01/2021') 
		list_b.mark_done
		master = TodoList.new
		master.add(list_b)
		master.add(list_c)
		master.add(list_d)
		complete = master.complete
		expect(complete).to eq(['Clean house'])
	end 
end 