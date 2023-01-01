import Foundation
struct Person
{
    let firstName : String?
    let lastName : String?
    
    //we create a emun that conform error protocol
    enum Errors : Error {
        case firstNameIsNil
        case lastNameIsNil
        case bothNameAreNil
    }
    //    func  getFullName() throws -> String? {
    //        //to check nil state we use many if else
    //        if let firstName ,let  lastName
    //        {
    //            print("fistName : \(firstName) and lastName : \(lastName)")
    //        }else if firstName == nil ,lastName != nil{
    //            throw PersonErrors.firstNameIsNil
    //        }
    //    }
    //we could change the above function to this
    //if the function return errors we set ((throws)) before return type
    func  getFullName() throws -> String? {
        //to check nil state we use switch
        switch( firstName , lastName)
        {
            case (.none , .none) :
                throw Errors.bothNameAreNil
            case (.none , .some) :
                throw Errors.firstNameIsNil
            case (.some , .none) :
                throw Errors.lastNameIsNil
            case let (.some(firstName) , .some(lastName)):
                return "firstName : \(firstName) and lastName : \(lastName)"
        }
    }
}

//---------------------------------------------------------------------

let foo = Person(firstName: "Foo",lastName: nil)
//you can catch error with ((do try catch))
do{
    let fullName = try foo.getFullName()
}
//catch{
//    print("got an error :\(error)")
//}
//or
catch let err{
    print("got an error :\(err)")
}
//---------------------------------------------------------------------

//catch specific error with ((is))
do{
    let fullName1 = try foo.getFullName()
}
catch is Person.Errors {
    print("got an error ")
}
//---------------------------------------------------------------------
//catch specific error with multi type catchs
let bar = Person(firstName: nil,lastName: nil)
Person.Errors.bothNameAreNil
do{
    let fullName2 = try bar.getFullName()
    fullName2
}
catch Person.Errors.firstNameIsNil {
    print("firstName is nil ")
}
catch Person.Errors.lastNameIsNil {
    print("lastName is nil ")
}
catch Person.Errors.bothNameAreNil {
    print("bothName Are nil ")
}
//---------------------------------------------------------------------
//throwing initializer
struct Car {
    
    let manufacture : String
    enum Errors : Error{
        case invalidManufacturer
    }
    //set throws for init
    init( manufacture : String) throws{
        if manufacture.isEmpty {
            throw Errors.invalidManufacturer
        }
        self.manufacture = manufacture
    }
}

do{
    let car = try Car(manufacture: "")
}
catch Car.Errors.invalidManufacturer
{
    print("Invalid manufacturer")
}
catch {
    print("there is another error")
}

//---------------------------------------------------------------------
//if you don't care about to handle a error with null safety you can use ((let with try?))
//for example the below line is saying to us if there is a value then set to variable othervise there is no value
if let myCar = try? Car (manufacture: "Tesla"){
    print("there is Value ")
}else
{
    print("failed to contrsuct and error is not accessible now")
}
//you have not to use ((try! )) because if there is no value the app would be crashed
let myCar2 = try! Car (manufacture: "Tesla")

//---------------------------------------------------------------------
//you can use ((try)) inside a function whitch has ((throws)) without ((do{}catch ))
struct Dog {
    let isInjured : Bool
    let isSleeping : Bool
    
    enum BarkingError : Error {
        case cannotBarkIsSleep
    }
    
    enum RunningError : Error {
        case cannotRunIsInjured
    }
    
    func bark() throws{
        if isSleeping{
            throw BarkingError.cannotBarkIsSleep
        }
        print("barkking .. ")
    }
    
    func run() throws{
        if isInjured{
            throw RunningError.cannotRunIsInjured
        }
        print("running ...")
    }
    
    //we can use ((try)) without ((do{}catch)) becuase run and bark function have ((throws))
    func runningAndBarking() throws{
        try run()
        try bark()
    }
}
 
let dog = Dog(isInjured: true, isSleeping: true)

do{
    try dog.runningAndBarking()
}
//we can marge many catches together in one catch
catch Dog.RunningError.cannotRunIsInjured,Dog.BarkingError.cannotBarkIsSleep
{
    print("it cannot run or cannot bark ")
}
catch{
    print("there is another error")
}
