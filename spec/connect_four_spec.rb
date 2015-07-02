require 'connect_four'

describe ConnectFour do
  
 # describe "#play" do
 #   it "starts the main loops" do
 #     expect(ConnectFour.new.play).to eq("Would you like to play (1)# against the computer or (2) against another player?")
 #   end
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
        b.game_board = Array.new(7) { %w(X X X X X X) }
      
      expect(b.add_piece(column,piece)).to eq(nil )
    end
  end
  
  describe "#full?" do

    it "checks if full" do
        b.game_board = Array.new(7) { %w(X X X X X X) }
      
      expect(b.full?).to eq(true)
    end

    it "checks if full" do
        b.game_board = Array.new(7) { %w(- X X X X X) }
      
      expect(b.full?).to eq(false)
    end


    it "checks if full" do
        b.game_board = Array.new(7) { %w(- X - X - X) }
      
      expect(b.full?).to eq(false)
    end

  end

  describe "#check_victory?" do
      
    it "checks if there is victory (vertical)" do
      b.game_board = [["-","-","X","X","X","X"],
                      ["-","-","-","-","-","-"],
                      ["-","-","-","-","-","-"],
                      ["-","-","-","-","-","-"], 
                      ["-","-","-","-","-","-"],
                      ["-","-","-","-","-","-"],
                      ["-","-","-","-","-","-"]]
      expect(b.check_victory?).to eq(true)
    end

    it "checks if there is victory (horizontal)" do
      b.game_board = [["-","-","X","-","-","-"],
                      ["-","-","X","-","-","-"],
                      ["-","-","X","-","-","-"],
                      ["-","-","X","-","-","-"], 
                      ["-","-","-","-","-","-"],
                      ["-","-","-","-","-","-"],
                      ["-","-","-","-","-","-"]]
      expect(b.check_victory?).to eq(true)
    end

    it "checks if there is victory (diagonal)" do
      b.game_board = [["-","-","-","-","-","-"],
                      ["-","-","-","X","-","-"],
                      ["-","-","X","-","-","-"],
                      ["-","X","-","-","-","-"], 
                      ["X","-","-","-","-","-"],
                      ["-","-","-","-","-","-"],
                      ["-","-","-","-","-","-"]]
      expect(b.check_victory?).to eq(true)
    end

  end


  describe Human do
    let(:b) { Board.new }
    let(:new_b_arr) { 
       [["X","-","-","-","-","-"],
        ["-","-","-","-","-","-"],
        ["-","-","-","-","-","-"],
        ["-","-","-","-","-","-"], 
        ["-","-","-","-","-","-"],
        ["-","-","-","-","-","-"],
        ["-","-","-","-","-","-"]]
    }
    let(:h) { Human.new("p1", "x", b) }

    describe "#get_move" do
      it "" do
        h.stub(:gets).and_return(1)
        h.get_move
        
        expect(b.game_board).to eq(new_b_arr)
      end

    end
  end

end





  

