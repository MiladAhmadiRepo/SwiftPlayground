import Foundation
struct Person
{
    var firstName : String?
    var lastName : String?
    
    //we create a emun that conform error protocol
    enum Errors: Error {
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
    let fullName = try foo.getFullName()
}
catch is Person.Errors {
    print("got an error ")
}
//---------------------------------------------------------------------
//catch specific error with multi type catchts
let bar = Person(firstName: nil,lastName: nil)
do{
    let fullName2 = try bar.getFullName()
    fullName2
}
catch is Person.Errors. {
    print("got an error ")
}
