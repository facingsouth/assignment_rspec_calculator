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
      
      it "checks if there is victory" do
        b.game_board = [["-","-","X","X","X","X"],["-","-","-","-","-","-"],["-","-","-","-","-","-"],["-","-","-","-","-","-"], ["-","-","-","-","-","-"],["-","-","-","-","-","-",],["-","-","-","-","-","-"]]
        expect(b.check_victory?).to eq(true)
      end
  end

end





  

