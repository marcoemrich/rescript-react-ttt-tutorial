open Jest
open Expect
open Board

test("A new Board should have 9 cells", () => {
  let board = make()
  expect(board->size) |> toEqual(9)
})

test("A new Board should have 9 EMPTY cells", () => {
  let board = make()
  expect(board->emptyCells->Array.length) |> toEqual(9)
})

test("Board.markAt should place an X in middle of the board", () => {
  let board = Board.make()
  let changedBoard = board->markAt(4)
  Js.log(Some(Cell.Player(O)))
  expect(changedBoard->at(4)) |> toEqual(Some(Cell.Player(X)))
})

test("Board.markAt should place an O as the second mark", () => {
  let board = Board.make()
  let changedBoard = board->markAt(4)->markAt(1)
  expect(changedBoard->at(1)) |> toEqual(Some(Cell.Player(O)))
})

test("Board.markAt should not overwrite an existing mark", () => {
  let board = Board.make()
  let changedBoard = board->markAt(4)->markAt(4)
  expect(changedBoard->at(4)) |> toEqual(Some(Cell.Player(X)))
})

test("Board.winner returns None for an empty board", () => {
  let board = Board.make()
  expect(board->winner) |> toEqual(None)
})

test("Board.winner returns X for top row", () => {
  let board: Board.t = [Player(X), Player(X), Player(X), Empty, Empty, Empty, Empty, Empty, Empty]
  expect(board->winner) |> toEqual(Some(Player.X))
})
test("Board.winner returns O for top row", () => {
  let board: Board.t = [Player(O), Player(O), Player(O), Empty, Empty, Empty, Empty, Empty, Empty]
  expect(board->winner) |> toEqual(Some(Player.O))
})

test("Board.winner returns O for right col", () => {
  let board: Board.t = [Empty, Empty, Player(O), Empty, Empty, Player(O), Empty, Empty, Player(O)]
  expect(board->winner) |> toEqual(Some(Player.O))
})
