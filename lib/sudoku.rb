class Sudoku

  SIZE = 81
  COLUMN_SIZE = 9
  BOX_SIZE = 3

  def initialize(args)
    raise "Wrong number of values given, #{SIZE} expected" unless args.length == SIZE
    @cells = args.split('').map {|v| Cell.new(v) }
  end

  def solve!    
    while not solved? do
      @cells.each_with_index do |cell, i|
        cell.update!(common_row(i), common_column(i), common_box(i))
      end
    end
  end

  def common_row(index)
    # integer division here
    from = index - index % COLUMN_SIZE
    @cells.slice(from, COLUMN_SIZE)
  end

  def common_column(index)
    initial = index % COLUMN_SIZE
    Array.new(COLUMN_SIZE).map {
      cell = @cells[initial]
      initial += COLUMN_SIZE
      cell
    }
  end

  def common_box(index)
    # integer division here, possibly suboptimal    
    initial = (index/(COLUMN_SIZE*BOX_SIZE))*COLUMN_SIZE*BOX_SIZE + index%COLUMN_SIZE
    Array.new(BOX_SIZE) {
      cells = @cells.slice(initial, BOX_SIZE) 
      initial += COLUMN_SIZE
      cells
    }.flatten
  end

  def solved?
    @cells.all? {|cell| cell.solved? }
  end

  def to_s
    @cells.map(&:value).join
  end
  
end