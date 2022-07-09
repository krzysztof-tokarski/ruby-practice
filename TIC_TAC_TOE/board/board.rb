class Board
  attr_reader :cells_state
  @@cells_state = Array.new(3) {Array.new(3, nil)}

  def initialize()
    @cells_state = @@cells_state
  end

  def set_cell_state(marker,y_coordinate,x_coordinate)
    self.cells_state[y_coordinate][x_coordinate] = marker;
  end

  def check_if_win
    horizontal_win_conditions = self.cells_state
    vertical_win_conditions = self.represent_columns_like_rows
    diagonal_win_conditions = self.represent_diagonals_like_rows
    win_conditions = [horizontal_win_conditions,vertical_win_conditions,diagonal_win_conditions]

    win_conditions.each do |array|
      self.check_if_cells_arrays_have_only_repeats(array)
    end
  end

  def check_if_cells_arrays_have_only_repeats(array)
    array.each do |row|
      if !(row.include? nil) && row.uniq.size == 1
        puts "#{row.first} wins the game!"
      end
    end
  end

  def represent_columns_like_rows()
    columns_represented_like_rows = self.cells_state.map.with_index do |row, static_index|
      row = []
      3.times do |index|
        row.push(self.cells_state[index][static_index])
      end
      row
    end
    columns_represented_like_rows
  end

  def represent_diagonals_like_rows()
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

