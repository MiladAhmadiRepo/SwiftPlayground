import Foundation
 
enum Animals{
    case butteerfly
    case dog,cat
    case cow,rabbit,fox
}

let animal=Animals.cat
switch animal {
case .cat:
    "this is a cat"
break
case .dog:
    "this is a dog"
    break
case .butteerfly:
    "this is a butteerfly"
    //you can cover other situation with default key word
default:
    "this is some thing else"
//case .cow:
//    "this is a cow"
//case .rabbit:
//    "this is a rabbit"
//case .fox:
//    "this is a fox"
}
