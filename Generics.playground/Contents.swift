import Foundation
import os


//generics it used to avoid writing the same function multiple times
func perfomInt( _ op : (Int , Int) -> Int , on lhs : Int , other rhs : Int) -> Int
{
    op(lhs,rhs)
}

perfomInt(+, on: 5, other: 10)
perfomInt(-, on: 5, other: 10)
perfomInt(/, on: 5, other: 10)
perfomInt(*, on: 5, other: 10)
//the above example shows us a function works with ((int)) values , on the other hand if you want to work
//with double values you have to write another function
//in this situation you can use generic functions
 
func performNumericGeneric <N: Numeric>(_ op: (N , N) -> N, on lhs : N, other rhs : N) -> N
{
    op(lhs , rhs)
}
//most important thing is the above function use ((Numeric)) which is a protocol and implemented in Double and Int as well
let NumInt = performNumericGeneric(+, on: 2, other: 5)
// ((NumInt)) is a int value
let NumDouble = performNumericGeneric(+, on: 2.2, other: 5.0)
// ((NumDouble)) is a double value


//you can set type of generic type in output section of function
func performNumericGeneric2 <N>(_ op: (N , N) -> N, on lhs : N, other rhs : N) -> N where N: Numeric
{
    op(lhs , rhs)
}
// look at the ((where)) section , we define type of  N

//---------------------------------------------------------------------------

protocol CanRun{
    func run()
}
protocol CanJump{
    func jump()
}

struct Person : CanRun , CanJump {
    func run() {
        print("Running ... ")
    }
    
    func jump() {
        print("Jumping .... ")
    }
}
func canRunAndJumpWithAny(value : Any){
//    value.run()
//    value.jump()
    //you can see there are no methods which named
}

//if you use generic types, you access to both of them : run() and jump()
func canRunAndJump<T : CanRun & CanJump>(value : T){
    value.run()
    value.jump()
}
let person = Person()
canRunAndJump(value: person)

//---------------------------------------------------------------------------

//there are many type of declaring array of string
let names = ["foo","bar"]
let names2 : [String] = ["foo","bar"]
let names3 : Array<String> = ["foo","bar"]
//you can see the array of string is a generic type like this ((Array<Element>))
//we can extend generic type like 2 ways
//extension Array where Element == String
//extension [String]
extension Array where Element == String {
    func longestString() -> String? {
        self.sorted { (lhs: String, rhs: String) -> Bool in
            return lhs.count > rhs.count
        }.first
    }
}

["baz","baz foo","foo"].longestString()

//---------------------------------------------------------------------------

//((associate types)) in protocols make generic protocols
protocol View {
    func addSubView (_ view : View)
}
//now add extention to implement the addSubView function
extension View{
    func addSubView (_ view : View){
            //empty
    }
}

//now we create a structure which inherited view protocol
struct Button :View{
    //empty
}

struct Table : View{
    
}
//we wanna represent any object in system that can be change to view
//we create a new protocol
protocol presentableAsView {
    //we tell to swift this protocol use generic type by ((associatetype))
    associatedtype ViewType :View
    
    //now we create a functio to produce a TypeView ((if the type would be a buttom ))
    //this function produce a button ((if the type would be a table ))
    //this function produce a table
    func produceView () -> ViewType
   
    func configure( superView : View , thisView : ViewType )
    func present ( view : ViewType , on superView : View)
}


extension presentableAsView {
    func configure( superView : View , thisView : ViewType ){
        //empty  by default
    }
    func present ( view : ViewType , on superView : View)
    {
        superView.addSubView(view)
    }
    
}

struct MyButton : presentableAsView{
    func produceView() -> Button {
        Button()
    }
    //you can see when you change return value of ((produceView)) method  to ((Button ))
    //swift change any viewType to Button
    func configure(superView: View, thisView: Button) {
        //empty
    }
}

//---------------------------------------------------------------

//you can constrain your extention to a specific types

extension presentableAsView where ViewType == Button{
    func doSomeThingWithButton(){
        print("this is a button")
    }
}
let buttom : MyButton()
//you can see we create an instance of MyButton and we access to  ((doSomeThingWithButton)) function
buttom.doSomeThingWithButton()


struct MyTable : presentableAsView{
    func produceView() ->   Table{
        Table()
    }
}
//on the other hand if we create an instance of MyTable 
//we cannot access to ((doSomeThingWithButton)) function
//because we set constrain for extention
let table = MyTable()
//table.doSomeThingWithButton()

//---------------------------------------------------------------

//there si another example of generic extention on array in swift
extention [Int]
{
    func average() -> Double {
        return Double(self.reduce(0,+)) / Double(self.count())
    }
}

[1,5,7,9,3].average()