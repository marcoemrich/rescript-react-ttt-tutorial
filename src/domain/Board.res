type t = array<Cell.t>

let width = 3

let make = () => Array.make(9, Cell.Empty)

let size = Array.length

let emptyCells = board => board->Array.keep(c => c == Cell.Empty)

let numberOf = (board, cell: Cell.t) => board->Array.keep(c => c == cell)->Array.length

let nextPlayer = board => board->numberOf(Cell.X) == board->numberOf(Cell.O) ? Cell.X : Cell.O

let markAt = (board: t, pos: int) =>
  Array.concatMany([
    board->Array.slice(~offset=0, ~len=pos),
    [board->nextPlayer],
    board->Array.sliceToEnd(pos + 1),
  ])

let at = (board, pos: int) => board[pos]
