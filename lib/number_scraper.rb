class Todo
  def initialize(entry, date) 
    @entry = entry
    @date = date
  end

  def read
    @entry
  end 

  def date
    @date
  end 

  def mark_done
    @done = 1
  end 

  def done 
    if @done == 1
        return true
    else 
        return false
    end
  end
end

