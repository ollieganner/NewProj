require_relative 'log'
require_relative 'to_do'
require_relative 'to_do_list'

class Diary
  def initialize
    @entries = []
  end 

  def entries 
    @entries
  end

  def add(entry) 
    @entries << entry
  end

  def add_list(list)   
    @list = list 
  end 
    
  def extract_numbers
		@phone_numbers =  @entries.map do |x|
			x.read.scan(/07[0-9]{9}/)
		end 
        @phone_numbers.join
  end

  def past_diary_and_to_do(day)
    entry = read_past(day)
    to_do = get_to_do(day)
    return [entry, to_do]
end 

  def get_to_do(day)
    @list.get_to_do(day)
  end 

  def read_past(day)
    entry = @entries.each do |x| 
        if x.date == day    
             return x.read
        end 
    end 
    fail "No such diary entry."
  end

  def select(wpm, min)
    word_time = wpm * min
    entry = 0
    cur = 0
    @entries.each do |x|
        if x.count > cur && x.count <= word_time
            entry = x 
            cur = x.count
        end 
    end 
    entry
    end
end