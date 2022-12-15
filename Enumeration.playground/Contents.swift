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
    //1- you can cover other situation with default key word
default:
    "this is some thing else"
//case .cow:
//    "this is a cow"
//case .rabbit:
//    "this is a rabbit"
//case .fox:
//    "this is a fox"
}

//-------------------------------------------------------------

enum Shortcuts{
    case fileAndFolder(path: URL,name :String)
    case wwwUrl(path : URL)
    case song(artist :String,songName: String)
}

let wwwApple=Shortcuts.wwwUrl(path: URL(string: "www.apple.com")!)
//you cannot compare a wwwApple with a url you pass to enum becacuse you have to implement == in enum

switch wwwApple{
case .fileAndFolder(path: let path, name: let name):
    print("\(path) - \(name)")
case .wwwUrl(path: let path):
    print("\(path) ")
case .song(artist: let artist, songName: let songName):
    print("\(artist) - \(songName)")
}

//you can make a summary of (( let )) after ((case)) key word
switch wwwApple{
case let.fileAndFolder(path: path, name: name):
    print("\(path) - \(name)")
case let.wwwUrl(path: path):
    print("\(path) ")
case let.song(artist: artist, songName: songName):
    print("\(artist) - \(songName)")
}

//you can remove external argument
switch wwwApple{
case let.fileAndFolder( path, name):
    print("\(path) - \(name)")
case let.wwwUrl( path):
    print("\(path) ")
case let.song(artist, songName):
    print("\(artist) - \(songName)")
}

//-------------------------------------------------------------

//add function to enum to get value by switch and ((self))
enum Vehicle{
    case car (manufacture :String, model :String)
    case bike (manufacture :String, yearMaid:Int)
    func getManufacture() -> String
    {
        switch self {
            //you can ignore some argument with (( _ ))
        case let .car(manufacture:  manufacture, _):
            return manufacture
        case let .bike(manufacture: manufacture, _):
            return manufacture
        }
    }
    //you can convert above function to property like this
    var manufacturer : String{
        switch self {
            //you can ignore some argument with (( _ ))
        case let .car(manufacture:  manufacture, _):
            return manufacture
        case let .bike(manufacture: manufacture, _):
            return manufacture
        }
    }
}

let car=Vehicle.car(manufacture: "Tesla", model: "X")
let bike=Vehicle.bike(manufacture: "HD", yearMaid: 1989)

car.getManufacture()
car.manufacturer
bike.getManufacture()
bike.manufacturer

//-------------------------------------------------------------


//you can use raw data with enum like this
enum FamilyMember : String{
    case Father = "dad"
    case Brother = "bro"
    case Mother = "mom"
    case Sister = "sis"
}

FamilyMember.Brother.rawValue
FamilyMember.Father.rawValue

// you can use ((case iterable)) in enum
enum FavoriteEmoji : String , CaseIterable {
    case blush = "😊"
    case rocket = "🚀"
    case fire = "🔥"
}
FavoriteEmoji.allCases
FavoriteEmoji.allCases.map(\.rawValue)

//-------------------------------------------------------------

//you can compare raw value with enum raw values without implementation of ((=))
if let blush = FavoriteEmoji(rawValue: "😊")
{
    print("Found the blush emoji")
    blush
}else{
    print("This emoji does not exist")
}
 

if let snow = FavoriteEmoji(rawValue: "❄️")
{
    print("Snow exist really ??")
    snow
}else{
    print("As expected , snow doesnot exist in our enum")
}

//-------------------------------------------------------------

//you can use ((mutating function)) in enum
enum Height {
    case short ,medium , long
    mutating func makeLog(){
        self = Height.long
    }
}

var myHeight=Height.medium
myHeight.makeLog()
myHeight

//-------------------------------------------------------------

//you can call a enum recursively into enum like this with ((indirect)) keyword
indirect enum IntOperation{
    case add(Int,Int)
    case sub(Int,Int)
    case freeHand(IntOperation)
    
    func calculateResult(of operation : IntOperation? = nil) -> Int
    {
        switch operation ?? self {
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .sub(lhs, rhs):
            return lhs - rhs
        case .freeHand(_):
            return calculateResult(of: operation)
        }
    }
}
let freehand = IntOperation.freeHand(IntOperation.add(2, 8))
freehand.calculateResult()

//-------------------------------------------------------------

