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
  expect(changedBoard->at(4)) |> toEqual(Some(Cell.X))
})

test("Board.markAt should place an O as the second mark", () => {
  let board = Board.make()
  let changedBoard = board->markAt(4)->markAt(1)
  expect(changedBoard->at(1)) |> toEqual(Some(Cell.O))
})

test("Board.markAt should not overwrite an existing mark", () => {
  let board = Board.make()
  let changedBoard = board->markAt(4)->markAt(4)
  expect(changedBoard->at(1)) |> toEqual(Some(Cell.X))
})
