import Foundation

//you use extentio to add functionality to existing types
extension Int {
    func plusTwo() -> Int {
        //here ((self)) refers to current integer instance
        self + 2
    }
}

let two = 2
//two+2
two.plusTwo()

//---------------------------------------------------------------------------

//when ever you create a struct there is a default initializer vs constructor internally
//on the other hand if you add a initializer ((init)) then it would be replased with default initilizer
struct Person{
    var name :String
    var lastName : String
}
//this is a default constructor
//var person= Person(name: <#T##String#>, lastName: <#T##String#>)

struct DefaultPerson{
    var name :String
    var lastName : String
    init(fullname: String) {
        self.name = "Nee"
        self.lastName = "Joo"
    }
}

// you can see there is no more default constructor
// there is just replaced contructor
//let defaultPerson = DefaultPerson(fullname: <#T##String#>)

//if you want to have default contsructor and new contructor at the same time
//you can add custom contructor into the ((extention))

extension Person{
    init(fullname: String) {
        let components = fullname.components(separatedBy: " ")
        self.init(name: components.first ?? fullname, lastName: components.last ?? fullname)
    }
}

//now you can see both of the constructors
//let person = Person(fullname: <#T##String#>)
//let person = Person(name: <#T##String#>, lastName: <#T##String#>)

let person = Person(fullname: "Foo Bar")
person.name
person.lastName

//---------------------------------------------------------------------------

//you can extend ((protocols)) as well
protocol GoesVroom{
    var vroomValue : String { get }
    func goVroom () -> String
}

//this is an implementation of goVroom method
extension GoesVroom {
    func goVroom () -> String{
        "\(self.vroomValue) goes vroom"
    }
}


struct Car {
    let manufacture : String
    let model : String
}

//now we extend the Car class with GoesVroom protocol implementation which has to implement the vroomValue as well as ((goVroom))
extension Car : GoesVroom {
    var vroomValue: String{
        "manufacture \(self.manufacture) model \(self.model)"
    }
}

let modelX = Car(manufacture: "Tesla", model: "X")
modelX.goVroom()

//---------------------------------------------------------------------------

//how to use the extentions in class : you can add convenience initilazer in extention
class MyDouble{
    let value : Double
    init(value : Double)
    {
        self.value = value
    }
}

extension MyDouble{
    convenience init(){
        self.init(value: 0)
    }
}

let myDouble = MyDouble()
//you see, I didn't intialize a value for init constructor
myDouble.value

//---------------------------------------------------------------------------

//you can extend protocols with extentions
extension GoesVroom{
    func goVroomVroomEvenMore() -> String {
        "\(self.vroomValue) is vrooming even more "
    }
}

modelX.goVroomVroomEvenMore()

