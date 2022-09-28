class Log
  def initialize(entry, date)
    @entry = entry
    @date = date
  end 
  def date 
    @date
  end 

  def read
    @entry
  end

  def count 
    @entry.split(' ').length
  end
end