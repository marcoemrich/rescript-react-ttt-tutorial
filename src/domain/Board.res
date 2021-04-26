type t = array<Cell.t>

let width = 3

let make = () => Array.make(9, Cell.Empty)

let size = Array.length

let emptyCells = board => board->Array.keep(c => c == Cell.Empty)

let numberOf = (board, cell: Cell.t) => board->Array.keep(c => c == cell)->Array.length

let nextPlayer = board =>
  board->numberOf(Cell.Player(X)) == board->numberOf(Cell.Player(O))
    ? Cell.Player(Player.X)
    : Player(Player.O)

let markAt = (board: t, pos: int): t => {
  switch board[pos] {
  | Some(Cell.Empty) =>
    Array.concatMany([
      board->Array.slice(~offset=0, ~len=pos),
      [board->nextPlayer],
      board->Array.sliceToEnd(pos + 1),
    ])
  | _ => board
  }
}

let winner: t => option<Player.t> = board =>
  switch board {
  | [Player(p0), Player(p1), Player(p2), Empty, Empty, Empty, Empty, Empty, Empty]
    if p0 === p1 && p1 === p2 =>
    Some(p0)
  | _ => None
  }

let at = (board, pos: int) => board[pos]
