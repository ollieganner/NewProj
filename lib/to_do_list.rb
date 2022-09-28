require_relative 'log'
require_relative 'to_do'
class TodoList
  def initialize
    @entries = []
  end 

  def entries
    @entries
  end

  def add(entry) 
    @entries << entry
  end

  def complete
    output = []
    @complete = @entries.select {|x| x.done}
    @complete.each {|x| output << x.read}
    output
  end

  def incomplete
    @complete = @entries.select {|x| !x.done}
    output = []
    @complete.each {|x| output << x.read }
    output
  end

  def get_to_do(day)
    @entries.each do |x| 
        if x.date == day    
             return x.read
        end 
    end
    fail "No such to do."
  end 
end

