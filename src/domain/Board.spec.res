open Jest
open Expect

test("A new Board should have 9 cells", () => {
  let board = Board.make()
  expect(board->Board.size) |> toEqual(9)
})
