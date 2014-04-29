class Cell

  attr_reader :value

  def initialize(value)
    raise 'Single digit expected' unless value.length == 1
    @value = value.to_i rescue 0
    @candidates = []
  end
  
  def solved?
    value && value != 0
  end  

  def candidates=(v)
    @value = v.first if v.length == 1
    @candidates = v    
  end

  def update!(row, column, box)
    return if solved?
    self.candidates = (1..9).to_a - row.map(&:value) - column.map(&:value) - box.map(&:value)
  end
  
end