=begin

WHITE SQUARE' unicode (U+25A1)
  -Main tetris class
    -main loop for dropping pieces
      -board.render
      -get player input: (L)eft, (R)ight or (T)ransfer
        - if L, shape move to left by 1
        - elsif R, shape move to right by 1
        - elsif T, shape transfer
        - else do nothing
      - shape move down by 1
      -call - check full line?
          if yes-remove line
      - break if game_over?

  -board class
    - builds the 10 X 18 game board
    -render board 
    - drop piece
    -full line check method
    
  -shapes class
    - builds all the game piece shapes
     -O (square)  -S     -L      -T
     -I           -Z     -J

    - shape move left
    - shape move right 
    - shape transfer
    - shape move down

=end