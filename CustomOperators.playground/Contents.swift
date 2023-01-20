import Foundation

// you can not use ((+)) operator with optional string with + operator
let firstName : String? = "Foo"
let lastName : String? = " Bar"

//let fullName : String? = firstName + lastName

//we can overwrite + operator
//binary infix
func + (lhs : String? , rhs : String?) -> String?
{
    switch(lhs , rhs)
    {
        case (.none , .none):
            return nil
        case let (.some(value) , .none):
            return value
        case let (.none , .some(value2)):
            return value2
        case let (.some(value) , .some(value2)):
            return value + value2
    }
}
//now we can concat two optional string with + operator
var fullName : String? = firstName + lastName

//--------------------------------------------------------------------
//now you can unary prefix
prefix operator ^
prefix func ^ (value : String ) ->String{
    value.lowercased()
}
let upperCase = "Foo Bar"
let lowerCase = ^upperCase
lowerCase
 
//--------------------------------------------------------------------
//now you can unary postfix

postfix operator *
postfix func * (value : String) -> String
{
    "*** \(value) ***"
}
let withStars = lowerCase*
withStars


//--------------------------------------------------------------------
//operator on structs
struct Person {
    let name : String
}

struct Family {
    let numbers : Array<Person>
}

let mom = Person(name: "Mom")
let dad = Person(name: "Dad")
let son = Person(name: "Son")
let daughter1  = Person(name: "Daughter1")
let daughter2  = Person(name: "Daughter2")


//let family = mom + dad
//we could use + operator to contact 2 person names
func + (lhs : Person , rhs : Person) -> Family
{
    Family(numbers: [lhs,rhs])
}
let family = mom + dad
family.numbers.count


func + (lhs : Person , rhs : Family) -> Family{
    var familyMembers = rhs.numbers
    familyMembers.append(lhs)
    return Family(numbers: familyMembers)
}


let familyWithSon = son + family
familyWithSon.numbers.count

func + (lhs : Family , rhs : [Person]) -> Family{
    var familyMembers = lhs.numbers
    familyMembers.append(contentsOf: rhs)
    return Family(numbers: familyMembers)
}

let familyWithDaughters = familyWithSon + [daughter1 , daughter2]
familyWithDaughters

