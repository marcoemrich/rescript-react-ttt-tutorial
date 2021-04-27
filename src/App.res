open React

@react.component
let make = () => {
  <>
    <div className="bg-gray-500 p-8 text-gray-100 text-2xl text-center m-5">
      {"Hello World"->string}
    </div>
  </>
}
