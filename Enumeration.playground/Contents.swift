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


enum Shortcuts{
    case fileAndFolder(path: URL,name :String)
    case wwwUrl(path : URL)
    case song(artist :String,songName: String)
}

let wwwApple=Shortcuts.wwwUrl(path: URL(string: "www.apple.com")!)
//you cannot compare a wwwApple with a url you pass to enum beacuse you have to implement == in enum

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

