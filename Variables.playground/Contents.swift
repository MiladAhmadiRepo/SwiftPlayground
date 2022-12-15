import Foundation

let myName = "milad"
let yourName = "milad"

var arrayName = [myName,yourName]
arrayName.append("reza")
arrayName.append("akbar")
 
let arrayNameUnmutable = [myName,yourName]
//you can not change let variables
//arrayNameUnmutable.append("newValue")

//-----------------------------------------------------------

//you can change a let variable by asgin a refrence types like ((classes))
let oldArray = NSMutableArray(
    array: ["foo","zee"]
)
//change a unmutable varibale by asign a refrence types
oldArray.add("jee")
var newArray=oldArray
newArray.add("lee")
//you can see the oldArray and NewArray are the same
