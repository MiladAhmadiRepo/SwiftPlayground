import Foundation

// this is a pattern to declare a strcut in swift
struct CommodoreComputer{
    let name: String
    let manufacture: String
    //this is a constractor for the structure
    init(name:String){
        self.name=name
        self.manufacture="Commodore"
    }
}

let c4m=CommodoreComputer(name: "c4m")

// create a function on a structure
struct FullName{
    let firstName: String
    let lastName: String
    //a function without input arguments
    var fullName: String{
        "\(firstName) \(lastName)"
    }
}

// all function in structure are immutable and you cannot change them

struct Car{
    var currentSpeed: Int
    // change immutable function to mutable in structure
    mutating func drive(speed: Int)
    {
        currentSpeed=speed
    }
}

// you cannot change the a mutable function into let varibale
////let immutableCar = Car(currentSpeed: 10)
////immutableCar.drive(speed: 20)
var immutableCar = Car(currentSpeed: 10)
immutableCar.drive(speed: 20)

//you can copy a structure just by passing into a varibale
let anotherCar=immutableCar
immutableCar.currentSpeed
immutableCar.drive(speed: 35)
immutableCar.currentSpeed
anotherCar.currentSpeed
