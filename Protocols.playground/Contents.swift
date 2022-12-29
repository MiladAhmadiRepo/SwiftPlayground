import Foundation

//protocols in swift is look like of interface in java
// you can not write a function with body in protocols
protocol CanBreath{
    func breathe()
}


//structure can inherite a protocol and a structure can not inherite another structure
struct Person : CanBreath{
    func breathe() {
        print("Person breathing ... ")
    }
}

struct Animal : CanBreath{
    func breathe() {
        print("Animal breathing ... ")
    }
}

let dog = Animal()
dog.breathe()
let person = Person()
person.breathe()

//---------------------------------------------------------------------------

//you can add implementation to a interface function by ((extention))
protocol CanJump{
    func jumping()
    func sitting()
}

extension CanJump{
    func jumping(){
        print("Jumping ... ")
    }
}

// if there is not any extention for the protocols
//you have to implement the functions in the child classes or structures
struct Cat : CanJump{
    //you dont need implement ((jumping)) method because it has implemented in extention ((CanJump))
    //and you have to implement ((sitting)) method
    func sitting() {
        print(" sitting ...")
    }
}
let wiskers = Cat()
wiskers.jumping()

//---------------------------------------------------------------------------

//you can add properties to protocols like this
protocol HasName{
    //this is the way to write down ((get properties)) in protocols
    var name : String { get }
    //you can not write variable with ((let)) in protocols
    //let familyName : String { get }
    //this is the right way to use ((let)) to implement the ((get)) variable
    var familyName : String { get }
    var age : Int { get set }
}

struct Dog : HasName{
    //you can comform  the properties in child struct or class like this
    //var name: String
    //the name variable is a (( get )) property and you can set it as a  (( let )) variable
    let name: String
    var familyName: String
    var age: Int
}
let woof = Dog(name: "woof", familyName: "woofy", age: 10)
woof.name
woof.age
//woof.age += 1

//---------------------------------------------------------------------------

//we add properties to protocols to use in extention and child classes
protocol Vehicle{
    var speed : Int {get set}
    mutating func increaseSpeed(by value :Int)
}

extension Vehicle {
    mutating func increaseSpeed(by value :Int){
        self.speed += value
    }
}

struct Bike :Vehicle{
    var speed: Int
    init(){
        self.speed = 0
    }
}

var bike = Bike()
bike.speed
bike.increaseSpeed(by: 10)
bike.speed

//---------------------------------------------------------------------------

//to comform a object is a protocol you can use ((is)) key word
func describe (obj:Any)
{
    if(obj is Vehicle)
    {
        print("object comforms to the Vehicle protocols ")
    }
    else
    {
        print("object doesnot comform to the Vehicle protocols ")
    }
}

describe(obj: bike)
struct Worm{
    
}
describe(obj: Worm())

//---------------------------------------------------------------------------

//you can use the ((as?)) key word to tell to the Swift the type of object

func increaseSpeedIfVehicle(obj : Any)
{
    if var vehicle = obj as? Vehicle {
        vehicle.speed
        vehicle.increaseSpeed(by: 15)
        vehicle.speed
    }
    else
    {
        print("this was not a vehicle")
    }
}

increaseSpeedIfVehicle(obj: bike)
// you can see the bike.speed not changed beacuase that is a ((struct)) and swift copy that ((by value))
bike.speed
