require './lib/sudoku'
input = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
# input = '000000900062000000000300006084052000000060300000004007500000083000090025700100000'

sudoku = Sudoku.new(input)
sudoku.solve!
puts sudoku