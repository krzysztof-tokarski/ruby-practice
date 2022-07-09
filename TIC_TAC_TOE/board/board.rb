class Board
  attr_reader :cells_state
  @@cells_state = Array.new(3) {Array.new(3, nil)}

  def initialize()
    @cells_state = @@cells_state
  end

  def set_cell_state(marker,y_coordinate,x_coordinate)
    p self.cells_state
    self.cells_state[y_coordinate][x_coordinate] = marker;
    p self.cells_state
  end

  # def check_if_win()
  # end

  def check_if_cells_arrays_have_only_repeats(array)
    p self.cells_state
    array.each do |row|
      unless row.include? nil && row.uniq.size != 1
        puts "#{row.first} wins the game!"
      else
        puts "nope"
      end
    end
  end

  def represent_columns_like_rows()
    p self.cells_state
    columns_represented_like_rows = self.cells_state.map.with_index do |row, iteration_index|
      p row
      p iteration_index
      row = []
      3.times do |index|
        p index
        row.push(self.cells_state[iteration_index][index])
      end
    end
    p columns_represented_like_rows
  end

  def represent_diagonals_like_rows()
    p self.cells_state
    arrays_array = Array.new(2) {Array.new(3, nil)}

    3.times do |index|
      arrays_array.first[index] = self.cells_state[index][index]
    end

    3.times do |index|
      arrays_array.last[index] = self.cells_state[index][2-index]
    end
    arrays_array
  end
end
