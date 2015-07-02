=begin
Test ConnectFour class
  - Make sure the play loop finishes a game**

  -choose_game_type - gives us valid responses when 1 or 2 entered
  - create_players - gives computer or human
  - switch_player changes current player

Board class
  add_piece - enters piece on board
  full - checks to see if board is full
  check_victory - to see if there is a winning combo
  
Human class
 -get_move - takes a valid input to add to board

Ai class
  generate_move - finds empty spot to win game
=end

require 'connect_four'

describe ConnectFour do
  
 # describe "#play" do
 #   it "starts the main loops" do
 #     expect(ConnectFour.new.play).to eq("Would you like to play (1)# against the computer or (2) against another player?")
 #   end
  let(:game) { ConnectFour.new }

  describe "#choose_game_type" do

    it "Get the correct input and reject invalid inputs" do
      
      game.stub(:gets).and_return("5", "3", "0", "2")

      expect(game.choose_game_type).to eq(2)
    end

  end

  describe "#create_players" do

    it "Initialize human player vs AI game with choice 1" do

      game.create_players(1)

      expect(game.player1).to be_a(Human)

      expect(game.player2).to be_a(AI)

    end

    it "Initialize two human players game with choice 2" do

      game.create_players(2)

      expect(game.player1).to be_a(Human)

      expect(game.player2).to be_a(Human)

    end
  end

  describe "#switch_player" do

    it "switch to player2 if current player is player1" do

      game.current_player = game.player1

      game.switch_player

      expect(game.current_player).to eq(game.player2)

    end

    it "switch to player1 if current player is player2" do

      game.current_player = game.player2

      game.switch_player

      expect(game.current_player).to eq(game.player1)

    end

  end

end

describe Board do
  let(:b){Board.new}
  
  describe "#add_piece" do
    it "add the pieces" do
        column = 4
        piece = "X"
      expect(b.add_piece(column,piece)).to eq(true)
    end

    it "add the pieces" do
        column = 4
        piece = "X"
        game_board = Array.new(7) { %w(X X X X X X) }
        board = Board.new(game_board)
      
      expect(board.add_piece(column,piece)).to eq(nil )
    end
  end
  
  describe "#full?" do

    it "checks if full" do
      game_board = Array.new(7) { %w(X X X X X X) }
      board = Board.new(game_board)
      
      expect(board.full?).to eq(true)
    end

    it "checks if full" do
      game_board = [["-","-","-","-","-","-"],
                    ["-","X","-","X","-","-"],
                    ["-","-","X","-","-","-"],
                    ["-","-","-","X","-","-"], 
                    ["-","-","-","-","X","-"],
                    ["-","-","-","-","-","-"],
                    ["-","-","-","-","-","-"]]

      board = Board.new(game_board)
      
      expect(board.full?).to eq(false)
    end


    it "checks if full" do
      game_board = Array.new(7) { %w(- X - X - X) }

      board = Board.new(game_board)
      
      expect(board.full?).to eq(false)
    end

  end

  describe "#check_victory?" do
      
    it "checks if there is victory (vertical)" do
      game_board = [["-","-","X","X","X","X"],
                    ["-","-","-","-","-","-"],
                    ["-","-","-","-","-","-"],
                    ["-","-","-","-","-","-"], 
                    ["-","-","-","-","-","-"],
                    ["-","-","-","-","-","-"],
                    ["-","-","-","-","-","-"]]

      board = Board.new(game_board)

      expect(board.check_victory?).to eq(true)
    end

    it "checks if there is victory (vertical)" do
      game_board = [["-","-","X","-","-","-"],
                    ["-","-","-","-","-","-"],
                    ["-","-","X","-","-","-"],
                    ["-","-","X","-","-","-"], 
                    ["-","-","X","-","-","-"],
                    ["-","-","-","-","-","-"],
                    ["-","-","-","-","-","-"]]
      board = Board.new(game_board)
      expect(board.check_victory?).to eq(false)
    end

    it "checks if there is victory (horizontal)" do
      game_board = [["-","-","X","-","-","-"],
                    ["-","-","X","-","-","-"],
                    ["-","-","X","-","-","-"],
                    ["-","-","X","-","-","-"], 
                    ["-","-","-","-","-","-"],
                    ["-","-","-","-","-","-"],
                    ["-","-","-","-","-","-"]]

      board = Board.new(game_board)
      expect(board.check_victory?).to eq(true)
    end

    it "checks if there is victory (diagonal)" do
      game_board = [["-","-","-","-","-","-"],
                    ["-","-","-","X","-","-"],
                    ["-","-","X","-","-","-"],
                    ["-","X","-","-","-","-"], 
                    ["X","-","-","-","-","-"],
                    ["-","-","-","-","-","-"],
                    ["-","-","-","-","-","-"]]

      board = Board.new(game_board)
      expect(board.check_victory?).to eq(true)
    end

    it "checks if there is victory (diagonal)" do
      game_board = [["-","-","-","-","-","-"],
                    ["-","X","-","X","-","-"],
                    ["-","-","X","-","-","-"],
                    ["-","-","-","X","-","-"], 
                    ["-","-","-","-","X","-"],
                    ["-","-","-","-","-","-"],
                    ["-","-","-","-","-","-"]]
      board = Board.new(game_board)
      expect(board.check_victory?).to eq(true)
    end

  end


  describe Human do
    let(:b) { Board.new }
    let(:new_b_arr) { 
       [["-","-","-","-","-","X"],
        ["-","-","-","-","-","-"],
        ["-","-","-","-","-","-"],
        ["-","-","-","-","-","-"], 
        ["-","-","-","-","-","-"],
        ["-","-","-","-","-","-"],
        ["-","-","-","-","-","-"]]
    }
    let(:h) { Human.new("p1", "X", b) }

    describe "#get_move" do
      it "it adds piece to proper place" do
        h.stub(:gets).and_return("1") 
        h.get_move
        
        expect(b.game_board).to eq(new_b_arr)
      end
      
    

      it "it loops when improper place entered" do
        h.stub(:gets).and_return("10","0","1") 
        h.get_move
        
        expect(b.game_board).to eq(new_b_arr)
      end

    end

  end

  describe AI do

    describe "#generate_move" do
      it "places piece in right position" do
        
        game_board = [["-","-","-","-","-","O"],
                      ["-","-","-","-","-","X"],
                      ["-","-","-","-","-","O"],
                      ["-","-","-","-","-","-"], 
                      ["-","-","-","-","-","O"],
                      ["-","-","-","-","-","O"],
                      ["-","X","X","O","O","X"]]
        b = Board.new(game_board)
        ai = AI.new("ai_board","O",b)
                    
        expect(ai.generate_move).to eq(4)
      end
    end
  
  end

end





  

