# Oyun tahtasını göster
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Kullanıcı girişini dizi indeksine çevirme
def input_to_index(input)
  index = input.to_i
  index -= 1
  return index
end

# Verilen indeksin dolu olup olmadığını kontrol etme
def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

# Kullanıcı girişi geçerli mi kontrol etme
def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    return true
  else
    return false
  end
end

# Hamle yapma
def move(board, index, character = "X")
  board[index] = character
  return board
end

# Sırayla oyuncuların hamle yapmasını sağlama
def turn(board)
  puts "Lütfen 1-9 arasında bir sayı girin:"
  num = gets.chomp
  index = input_to_index(num)
  if valid_move?(board, index)
    character = current_player(board)
    move(board, index, character)
    display_board(board)
  else
    turn(board)
  end
end

# Oyunu başlatma
def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Tebrikler, #{winner(board)} kazandı!"
  else
    puts "Oyun berabere!"
  end
end

# Oyuncu sırasını sayma
def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "X" || position == "O"
      counter += 1
    end
  end
  return counter
end

# Mevcut oyuncuyu döndürme
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

# Kazanan kombinasyonları tanımlama
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

# Kazananı kontrol etme
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]
    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" ||
      position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end
  return false
end

# Tahta dolu mu kontrol etme
def full?(board)
  board.all? do |board_full|
    board_full == "X" || board_full == "O"
  end
end

# Berabere mi kontrol etme
def draw?(board)
  full?(board) && !won?(board)
end

# Oyunun bitip bitmediğini kontrol etme
def over?(board)
  won?(board) || full?(board) || draw?(board)
end

# Kazananı bulma
def winner(board)
  checkwinner = won?(board)
  if checkwinner
    return board[checkwinner[0]]
  else
    return nil
  end
end

# Oyun tahtası oluşturma ve oyunu başlatma
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
display_board(board)
play(board)
