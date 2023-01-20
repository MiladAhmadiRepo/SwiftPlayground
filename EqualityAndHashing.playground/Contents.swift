import Foundation

struct Person : Equatable {
    let id : String
    let name : String
}

let foo = Person(id : "1" ,name : "Foo")

let bar = Person(id: "1", name: "Bar")

if foo == bar {
    print("two persons are the same person ")
}
else
{
    print("they are not same person")
}


//you can see these persons are not the same
//but we can impelement == to change the rule of equality
//with extention

extension Person {
    static func == (lhs : Self , rhs : Self) -> Bool
    {
        lhs.id == rhs.id
    }
}

//-------------------------------------------------------------
//lets write enum  equality
enum AnimalTypeWithoutEquitable {
    case dog(breed : String)
    case cat(breed : String)
}

let dog1 = AnimalTypeWithoutEquitable.dog(breed: "LabraDoodle")
let dog2 = AnimalTypeWithoutEquitable.dog(breed: "LabraDoodle")
//if dog1 == dog2 {
//    print("they are equal")
//}

//there is an error and the reason behind of this is they should be equitable

enum AnimalTypeWithEquatable : Equatable {
    case dog(breed : String)
    case cat(breed : String)
}
let dog3 = AnimalTypeWithEquatable.dog(breed: "LabraDoodle")
let dog4 = AnimalTypeWithEquatable.dog(breed: "LabraDoodle")
if dog3 == dog4 {
    print("they are equal")
}else
{
    print("they are not equal")
}
//-------------------------------------------------------------

//we can check the equality with ((Equatable extention))
enum AnimalTypeWithExtention {
    case dog(breed : String)
    case cat(breed : String)
}
extension AnimalTypeWithExtention : Equatable {
    static func == (lhs : Self , rhs : Self) -> Bool
    {
        switch (lhs , rhs)
        {
        case let (.dog(lhsBreed) , .dog(rhsBreed)) :
                return lhsBreed == rhsBreed
        case let (.cat(lhsBreed) , .cat (rhsBreed)) :
                return lhsBreed == rhsBreed
            default :
                return false
        }
    }
}
let dog5 = AnimalTypeWithExtention.dog(breed: "LabraDoodle")
let dog6 = AnimalTypeWithExtention.dog(breed: "LabraDoodle")
if dog5 == dog6 {
    print("they are equal")
}else
{
    print("they are not equal")
}
//-------------------------------------------------------------

//we can check the equality with (equtuatable struct)
struct Animal : Equatable {
    let name : String
    let type : AnimalTypeWithExtention
    
    static func == (lhs : Self , rhs : Self) -> Bool
    {
        lhs.type == rhs.type
    }
}

let cat1 = Animal(name: "Wiskers", type: .cat(breed: "Street cat"))
let cat2  = Animal(name: "Whoosh", type: .cat(breed: "Street cat"))

if cat1 == cat2 {
    print("they are equal because of their type")
}else
{
    print("they are not equal")
}
//you can remove extention and find out the code still work
//because you implement == in struct
//-------------------------------------------------------------
struct House : Hashable {
    let number : Int
    let numberOfBedRooms : Int
}

let house1 = House(number: 123, numberOfBedRooms: 2)
house1.hashValue
let house2 = House(number: 123, numberOfBedRooms: 3)
house2.hashValue

let houses = Set([house1 , house2])
houses.count

//you can set the whitch one of property would be hashing
struct NumberedHouse : Hashable {
    let number : Int
    let numberOfBedRooms : Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
    
    static func == (rhs : Self , lhs : Self) -> Bool
    {
        rhs.number == lhs.number
    }
}

let house3 = NumberedHouse(number: 123, numberOfBedRooms: 2)
let house4 = NumberedHouse(number: 123, numberOfBedRooms: 3)

let houses2 = Set([house3,house4])
// you can see there are just one element in set
houses2.count
house3.hashValue
house4.hashValue
 
//-------------------------------------------------------------
//let's check equality with hashable and enum
enum HouseType : Hashable {
    case BigHouse(NumberedHouse)
    case SmallHouse(NumberedHouse)
}

let bigHouse1 = HouseType.BigHouse(NumberedHouse(
number: 1, numberOfBedRooms: 5
))

let bigHouse2 = HouseType.BigHouse(NumberedHouse(
number: 1, numberOfBedRooms: 5
))

let smallHouse1 = HouseType.SmallHouse(NumberedHouse(
number: 1, numberOfBedRooms: 5
))

let allHouses : Set<HouseType> = [bigHouse1,bigHouse2,smallHouse1]
allHouses.count

 
