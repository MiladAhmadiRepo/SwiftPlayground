import Foundation

let myName = "milad"
let yourName = "milad"

var arrayName = [myName,yourName]
arrayName.append("reza")
arrayName.append("akbar")
 
let arrayNameUnmutable = [myName,yourName]
//todo - you can not change let variable
//arrayNameUnmutable.append("newValue")


//todo - you can change a let variable by asgin a refrence types
let oldArray = NSMutableArray(
    array: ["foo","zee"]
)
//todo - change a unmutable varibale by asign a refrence types
oldArray.add("jee")
var newArray=oldArray
newArray.add("lee")
//todo - you can see the oldArray and NewArray are the same
