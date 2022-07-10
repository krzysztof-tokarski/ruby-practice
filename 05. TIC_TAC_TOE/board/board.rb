require_relative './draw_grid.rb'

class Board
  attr_reader :cells_state, :row_with_only_repeats, :no_empty_cells

  @@cells_state = Array.new(3) { Array.new(3, nil) }

  def initialize()
    @cells_state = @@cells_state
    @row_with_only_repeats = false
  end

  def set_cells_state(marker, y_coordinate, x_coordinate)
    cells_state[y_coordinate][x_coordinate] = marker
  end

  def check_if_win
    horizontal_win_conditions = cells_state
    vertical_win_conditions = represent_columns_like_rows
    diagonal_win_conditions = represent_diagonals_like_rows
    win_conditions = [horizontal_win_conditions, vertical_win_conditions, diagonal_win_conditions]

    win_conditions.each do |array|
      unless @row_with_only_repeats
        check_if_cells_arrays_have_only_repeats(array)
      end
    end
    @row_with_only_repeats
  end

  def check_if_any_cell_is_free
    if @cells_state.flatten.count(nil).zero?
      @no_empty_cells = true
    end
    @no_empty_cells
  end

  def check_if_cell_is_free(y_coordinate, x_coordinate)
    cells_state[y_coordinate][x_coordinate].nil?
  end

  def render_board
    draw_grid(cells_state)
  end

  private
  def check_if_cells_arrays_have_only_repeats(array)
    array.each do |row|
      unless @row_with_only_repeats
        if !(row.include? nil) && row.uniq.size == 1
          @row_with_only_repeats = true
          break
        end
      end
    end
  end

  def represent_columns_like_rows
    cells_state.map.with_index do |row, static_index|
      row = []
      3.times do |index|
        row.push(cells_state[index][static_index])
      end
      row
    end
  end

  def represent_diagonals_like_rows
    arrays_array = Array.new(2) { Array.new(3, nil) }

    3.times do |index|
      arrays_array.first[index] = cells_state[index][index]
    end

    3.times do |index|
      arrays_array.last[index] = cells_state[index][2 - index]
    end
    arrays_array
  end
end
