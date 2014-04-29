require '../lib/sudoku'
require '../lib/cell'
require 'minitest/autorun'
require 'ruby-debug'

class SudokuTest < Minitest::Test

  def setup
    @sudoku = Sudoku.new '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
  end

  def test_common_row
    row = @sudoku.common_row(12)
    assert_equal 9, row.length
    assert_equal '000100906', row.map(&:value).join
  end

  def test_common_column
    column = @sudoku.common_column(12)
    assert_equal 9, column.length
    assert_equal '010009002', column.map(&:value).join
  end

  def test_common_box
    box = @sudoku.common_box(12)
    assert_equal 9, box.length
    assert_equal '003100068', box.map(&:value).join
  end

  def test_common_box_center
    box = @sudoku.common_box(30)
    assert_equal 9, box.length
    assert_equal '002040905', box.map(&:value).join
  end

end