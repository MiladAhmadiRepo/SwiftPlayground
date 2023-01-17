import Foundation

let numbers = [1,2,3,4]
numbers.map(-)

var mutatingNumber = [5,6,7]
mutatingNumber.append(8)
mutatingNumber.insert(4, at: 0)
 
//insert a whole array into another array by ((insert )) command
mutatingNumber.insert(contentsOf: [9,10,11], at: 5)

//use ((where)) key word with foreach
for value in mutatingNumber where value % 2 == 0
{
    print("value is : \(value) ")
}
//----------------------------------------------------------------------------------
//use ((map )) with collections
mutatingNumber.map{(value : Int) -> Int in
    value * 2
}

let strValues = mutatingNumber.map{
    (value : Int ) -> String in
    String(value * 2)
}
 
// use ((filter)) to filter the values of collection
let filterValues = mutatingNumber.filter{
    (value : Int) -> Bool in value % 2 == 0
}

//we can have ((filter and map )) in the same time with ((compact map))
let compactMap = mutatingNumber.compactMap{
    (value : Int) -> String? in value % 2 == 0 ? String(value) : nil
}
//----------------------------------------------------------------------------------

//custom arry with ((any))
let stuff1 = [ 1, "two" , 3 , 4.1] as [Any]
//or
let stuff2 : [Any] = ["five" , 6.8 , "seven" , 8]


//----------------------------------------------------------------------------------
//((set)) only contains unique values
let stuff3 = Set ([1,2,3,1,3,4])
stuff3.map(-)

let uniqueNilValues = Set([5 , nil ,3,5 ,nil])
let notNilValues = uniqueNilValues.compactMap{$0}

//create a ((any set)) with ((AnyHashable))
let stuff4 : Set<AnyHashable> = [ 1 , 2 , 3 , "milad" , 5 , "joe"]
stuff4.count

//----------------------------------------------------------------------------------
//you can extract specific type values by ((as?)) in array
let intInStuff1 = stuff1.compactMap{
    (value : Any) -> Int? in
    value as? Int
}

let stringInStuff1 = stuff1.compactMap{
    (value : Any) -> String? in
    value as? String
}
//you can extract specific type values by ((as?)) in Set
let intInStuff4 = stuff4.compactMap{
    (value : AnyHashable) -> Int? in
    value as? Int
}

//----------------------------------------------------------------------------------
//caculate uniqueness with hashable
struct Person {
    let id : UUID
    let name : String
    let age : Int
}

let bazUUID = UUID()
let baz = Person(id: bazUUID, name: "Baz", age: 20)
let jee = Person(id: bazUUID, name: "Jee", age: 30)

//let setBaz = Set([baz , jee])
//you can see , we could not add 2 instances of person in ((set)),the reason behind of this is,  they should be hashable
struct Person2 : Hashable {
    let id : UUID
    let name : String
    let age : Int
}

let bazUUID3 = UUID()
let baz2 = Person2(id: bazUUID3, name: "Baz", age: 20)
let jee2 = Person2(id: bazUUID3, name: "Jee", age: 30)
//you can see after we add the hashable to the struct
//set has 2 person with same id
let setBaz2 = Set([baz2 , jee2])
setBaz2.count

//to seperate person with id we implement ((==))
struct Person3 : Hashable {
    let id : UUID
    let name : String
    let age : Int
    //you can say to swift just hash a filed of struct
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    //now we override the equality ((==)) to tell the swift
    //if there was equality of ids then those object are the same
    static func == (lhs : Self , rhs : Self) -> Bool	{
        return lhs.id == rhs.id
    }
}

let bazUUID5 = UUID()
let baz3 = Person3(id: bazUUID5, name: "Baz", age: 20)
let jee3 = Person3(id: bazUUID5, name: "Jee", age: 30)
let setBaz3 = Set([baz3 , jee3])
setBaz3.count
//you can see there just one person and it because there is 2 person with one id

//----------------------------------------------------------------------------------

//dictionary in swift is like a json
let userInfo = [
    "name" : "Foo",
    "age" : 20 ,
    "address" : [
        "line1" : "Address Line 1",
        "PostCode" : "123456"
    ]
] as [String : Any]

//get value of dictionary
userInfo["name"]
userInfo["age"]
 
//to get a dictionary as a value you can use for
for (key , value ) in userInfo{
    key
    value
}

//you can get a specific value type
for (key , value ) in userInfo where value is [String : String]{
    key
    value
}

//also you use multiple where clouses in for
for (key , value ) in userInfo where value is Int && key.count > 2 {
    key
    value
}
