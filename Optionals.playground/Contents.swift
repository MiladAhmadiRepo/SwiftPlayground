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
    let ageStillOptional = age
    ageStillOptional
    print("Age is not nill odd!!")
}


checkAge()
//use ((guard let)) together means we sure about that variable is not nill
//if you pass varibale to another variable the second variable is not optional
let age2: Int? = 0
func checkAge2(){
    //guard let is saying : make sure it's not nil otherwise print this
    guard let age2 else{
        print("Age2 is nill ? How Strange")
        return
    }
    let age2StillOptional = age2
    age2StillOptional
    print("Age2 is not nill as expected . Value =\(age2)")
}

checkAge2()
