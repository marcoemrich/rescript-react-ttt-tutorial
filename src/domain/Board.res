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
let eq3 = (x, y, z) => x == y && y == z

let winner: t => option<Player.t> = board =>
  switch board {
  | [Player(p0), Player(p1), Player(p2), _, _, _, _, _, _] if eq3(p0, p1, p2) => Some(p0)
  | [_, _, _, Player(p0), Player(p1), Player(p2), _, _, _] if eq3(p0, p1, p2) => Some(p0)
  | [_, _, _, _, _, _, Player(p0), Player(p1), Player(p2)] if eq3(p0, p1, p2) => Some(p0)
  | [Player(p0), _, _, Player(p1), _, _, Player(p2), _, _] if eq3(p0, p1, p2) => Some(p0)
  | [_, Player(p0), _, _, Player(p1), _, _, Player(p2), _] if eq3(p0, p1, p2) => Some(p0)
  | [_, _, Player(p0), _, _, Player(p1), _, _, Player(p2)] if eq3(p0, p1, p2) => Some(p0)
  | [Player(p0), _, _, _, Player(p1), _, _, _, Player(p2)] if eq3(p0, p1, p2) => Some(p0)
  | [_, _, Player(p0), _, Player(p1), _, Player(p2), _, _] if eq3(p0, p1, p2) => Some(p0)
  | _ => None
  }

let at = (board, pos: int) => board[pos]
