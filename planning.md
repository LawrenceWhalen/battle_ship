* Aim to complete Meets expectations section of rubric.
  * Complete iteration 3
  * Board, Cell, Ship Classes and one addition Class
  * Complete testing with no more than two failures
  * Pull and commit

* Setup Complete

* Iteration 1
  * Ship Class
    * Attributes
      * Name
      * Length
      * health starting/current
    * Methods
      * sunk?
      * hit
      * health
  * Cell
    * Attributes
      * coordinate
      * contents
    * Methods
      * empty?
      * place_ship
      * fired_upon?
      * fire_upon
      * render
        * . if empty
        * M for miss
        * H for hit
        * X for sunk
        * render(true) to show hidden ship

*Iteration 2
  *Board
  { "A1", "A2", "A3", "A4",
    "B1", "B2", "B3", "B4",
    "C1", "C2", "C3", "C4",
    "D1", "D2", "D3", "D4", }
    *Attributes
      * Cells
        * Cells are already handled by Cell class
        * All created at initialize
    *Methods
      * valid_coordinate?
        * boolean
        * gets passed a string
        * compares string to hash keys
      * valid_placement?
        * boolean
        * passed an array
        * length of the array to match length of ship
        * make sure they are in correct order
        * makes sure that keys aren't diagonal
        * make sure no cells are already occupied
      * place
              #
            /
          # - #
            \
              #
        * passed a ship instance and coordinates
        * sets those coordinates to point to that ship instance
      * render
        * print the output of cell.render for all cells in hash
