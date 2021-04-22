open React

@react.component
let make = () => {
  let (board, setBoard) = useState(() => Board.make())

  let mark = index => setBoard(board => board->Board.markAt(index))

  <div className="grid grid-cols-3 gap-0 w-50 h-50 f-20">
    {board->Array.mapWithIndex((index, cell) => <UI_Cell cell mark index />)->array}
  </div>
}
