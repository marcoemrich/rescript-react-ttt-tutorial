type t = array<Cell.t>

let make = () => {
  Array.make(9, Cell.Empty)
}

let size = board => Array.length(board)
