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

//---------------------------------------------------------------------
//re throws
//we talking about a function internally call another function which can also throw and it is
//as input closure in parent function
func fullName(firstName : String? , lastName : String?
              , calculator : (String? , String?) throws -> String?
) rethrows -> String? {
  try  calculator(firstName , lastName)
}

enum NameErrors : Error {
    case InvalidFirstName
    case InvalidLastName
}

//create a closure to concat two string or return throws
func + (firstName : String? , lastName : String?) throws -> String?
{
    guard let firstName , !firstName.isEmpty else
    {
        throw NameErrors.InvalidFirstName
    }
    guard let lastName , !lastName.isEmpty else{
        throw NameErrors.InvalidLastName
    }
    return "\(firstName) \(lastName)"
}

 
do{
    //let fooBar = try fullName(firstName: "Foo", lastName: "Bar", calculator: +)
    //let fooBar = try fullName(firstName: nil, lastName: nil, calculator: +)
    let fooBar = try fullName(firstName: "Foo", lastName: nil, calculator: +)
}catch NameErrors.InvalidFirstName{
    print("Firstname is nil")
}catch NameErrors.InvalidLastName {
    print("Lastname is nil ")
}catch let err{
    print("some another error ocured \(err)")
}

//---------------------------------------------------------------------
//you can use ((result<typeOfValue , errorValue>)) instead of throws which make more sence
//to understad and readable your functions

enum IntergerErrors : Error {
    case noPreviousPositiveIntergerBefore(thisValue : Int)
    case zeroNumberBefore(thisValue : Int)
}

func getPreviousPositiveInteger( externalValue internalValue :Int )
    -> Result<Int ,IntergerErrors>
{
    
    if internalValue == 0 {
        return Result.failure(
            IntergerErrors.zeroNumberBefore(thisValue: internalValue)
        )
    }
    guard internalValue > 0  else {
        return Result.failure(
            IntergerErrors.noPreviousPositiveIntergerBefore(thisValue: internalValue)
        )
    }
    return Result.success(internalValue - 1)
}
//the prevoius function we use ((Result)) instead of ((throws))
//to make clear return value from a function
//if there is an error the enum value returns
//otherwise the success section returns ((value -1))

//now we use switch to call above function
func performGet (fromValue value : Int){
    //the ((Result)) is an enum and you can switched on it
    switch getPreviousPositiveInteger(externalValue: value){
        case let .success(previousValue) :
            print("previous value is \(previousValue)")
        
        case let .failure(error):
        switch error {
            //the error is ((IntergerErrors)) is an enum which can be switch on that
            case let .noPreviousPositiveIntergerBefore(thisValue):
                print("no posotive integer value pervious \(thisValue)")
            case let .zeroNumberBefore(thisValue) :
                print("zero is not positive value \(thisValue)")
        }
    }
}

performGet(fromValue: -1)
//performGet(fromValue: 0)
//performGet(fromValue: 2)
//---------------------------------------------------------------------
