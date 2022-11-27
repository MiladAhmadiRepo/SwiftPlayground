import Foundation

let myAge=20
let yourAge=22

if myAge>yourAge{
    "I'm oldther than you"
}else if myAge<yourAge{
    "You are oldther than me"
}
else{
    "we are the same age"
}

//---------------------------------
//((unary prefix)) like: !true which fill our variable with false value
let foo = !true
//((unary postfix)) like: name! which make name variable not optional
let name = Optional("Milad")
type(of: name)
let unaryPostfixVariable = name!
type(of: unaryPostfixVariable)
//((binary infix)) like: +,*,/, or other operator which work on two operand
let result = 1 + 2
//---------------------------------
let age=20
//condition experssions
var message = age > 20 ? "you are an adult" : "you are not an adult yet"
