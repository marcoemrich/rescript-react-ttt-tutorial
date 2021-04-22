open React

@react.component
let make = (~cell: Cell.t, ~mark: int => unit, ~index: int) =>
  <button onClick={_e => mark(index)} className="border-1 border-red-500 rounded-none text-7xl m-0">
    {switch cell {
    | Cell.Empty => `\xa0`
    | Cell.X => "X"
    | Cell.O => "O"
    }->string}
  </button>
