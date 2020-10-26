class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index,token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
    end

    def valid_move?(index)
        (0..8).include?(index) && !position_taken?(index)
    end

    def turn
        puts "Please enter 1-9:"
        index = input_to_index(gets.strip)
        current_player = self.current_player
        valid_move?(index) ? move(index, current_player) : turn
        display_board
    end

    def won?
        WIN_COMBINATIONS.detect do |combination| 
            ["X","O"].any? { |token| combination.all? { |cell| @board[cell] == token } }
        end
    end

    def full?
        turn_count == 9
    end

    def draw?
        full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        ["X","O"].detect do |token| 
            WIN_COMBINATIONS.any? { |combination| combination.all? { |cell| @board[cell] == token } }
        end
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end