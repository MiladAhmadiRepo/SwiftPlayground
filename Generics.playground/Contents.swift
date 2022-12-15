import Foundation


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
//----------------------------------------------------

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

//----------------------------------------------------------------
