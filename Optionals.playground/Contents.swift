import Foundation

func multipyByTwo (_ value : Int? = 0) -> Int
{
    return value ?? 0
}

multipyByTwo(nil)
multipyByTwo(8)
multipyByTwo()

// some example of optional values

 
let age : Int? = nil
//you can use ((if let)) to check a value exist
if let age{
    print("Age is there ?? How odd \(age)")
}else
{
    print("Not is there ")
}

//we can use (( guard )) to make sure the variable does not nil
//if you pass varibale to another variable the second variable is still optional
func checkAge () {
    //guard is saying : make sure it's not nil otherwise print this
    guard age != nil else{
        print("Age is nil as expected")
        return
    }
    //you can see ((ageStillOptional)) is optional
    let ageStillOptional = age
    print("Age is not nill odd!!")
}


checkAge()
//use ((guard let)) together means we sure about that variable is not nill
//if you pass varibale to another variable the second variable is not optional
let age2: Int? = 0
func checkAge2(){
    //((guard let)) is saying : make sure it's not nil otherwise print this
    guard let age2 else{
        print("Age2 is nill ? How Strange")
        return
    }
    //you can see ((age2StillOptional)) is not optional,in contrast we've checked the vlaue of ((age2)) with ((guard let))
    let age2StillOptional = age2
    print("Age2 is not nill as expected . Value =\(age2)")
}

checkAge2()

//chain of optionals values would be looklike this
struct Person {
    let name : String
    let address : Address?
    struct Address{
        let firstLine : String?
    }
}

let foo : Person = Person(name: "foo", address: nil)
if let fooFirstAddressLine = foo.address?.firstLine{
    print(fooFirstAddressLine)
}
else
{
    print("Foo doesn't have an address with first line . as expected")
}


if let fooAddress   = foo.address ,
   let firstLine = foo.address?.firstLine{
    fooAddress
    firstLine
}else
{
    print("there is no data")
}

//----------------------------------------------------------
//in the below example you can see if we set ((nil)) for address
//let bar : Person? = Person(name: "Bar", address: nil)

//still swift would call the positive section of condition
//because swift follows trails to get further more to firstline
//in any part of that , if the value be null
//the swift assume the firstline would be null
let bar : Person? = Person(name: "Bar", address: Person.Address(firstLine: nil))
if bar?.name == "Bar" , bar?.address?.firstLine == nil{
    print("bar name is Bar and has no firstline of address")
}else
{
    print("seems like something isn't working right")
}

//----------------------------------------------------------
let baz : Person? = Person(name: "Baz", address: Person.Address(firstLine: "Baz firstline Address"))
//you can use switch on optional values
//use some to check is there a value
//use none to check is doesn'nt exsit a value
switch baz?.address?.firstLine{
case let .some(firstLine) where firstLine.starts(with: "Baz"):
    print("Baz first line address = \(firstLine)")
case let .some(firstLine) :
    print("Baz first line address doesn't match ")
case .none :
    print("Baz first line address is nill ,weird !!! ")
}


//----------------------------------------------------------
//use guard let for optional values
func getFullName (firstName : String ,lastName : String? ) -> String?
{
    //make sure the lastname isn't null
    //otherwise return nil
    guard let lastName else{
        return nil
    }
    return "fistrname : \(firstName) and lastName : \(lastName)"
}
