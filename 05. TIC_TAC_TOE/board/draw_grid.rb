# taken from https://codereview.stackexchange.com/questions/201159/drawing-an-ascii-grid-in-ruby-based-on-a-2d-array

# Renders an ASCII grid based on a 2D array
def draw_grid(args, boxlen=3)
  #Define box drawing characters
  side = '│'
  topbot = '─'
  tl = '┌'
  tr = '┐'
  bl = '└'
  br = '┘'
  lc = '├'
  rc = '┤'
  tc = '┬'
  bc = '┴'
  crs = '┼'
  ##############################
  draw = []
  args.each_with_index do |row, rowindex|
    # TOP OF ROW Upper borders
    row.each_with_index do |col, colindex|
      if rowindex == 0
        colindex == 0 ? start = tl : start = tc
        draw << start + (topbot*boxlen)
        colindex == row.length - 1 ? draw << tr : ""
      end
    end
    draw << "\n" if rowindex == 0

    # MIDDLE OF ROW: DATA
    row.each do |col|
      draw << side + col.to_s.center(boxlen)
    end
    draw << side + "\n"

    # END OF ROW
    row.each_with_index do |col, colindex|
      if colindex == 0
        rowindex == args.length - 1 ? draw << bl : draw << lc
        draw << (topbot*boxlen)
      else
        rowindex == args.length - 1 ? draw << bc : draw << crs
        draw << (topbot*boxlen)
      end
      endchar = rowindex == args.length - 1 ? br : rc

      #Overhang elimination if the next row is shorter
      if args[rowindex+1]
        if args[rowindex+1].length < args[rowindex].length
          endchar = br
        end
      end
      colindex == row.length - 1 ? draw << endchar : ""
    end
    draw << "\n"
  end


  draw.each do |char|
    print char
  end
  return true
end
