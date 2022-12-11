import Foundation

//protocols in swift is look like of interface in java
// you can not write a function with body in protocols
protocol CanBreath{
    func breathe()
}


//structure can inherite a protocol and a structure can not inherite another structure
struct Person : CanBreath{
    func breathe() {
        print("Person breathing ... ")
    }
}

struct Animal : CanBreath{
    func breathe() {
        print("Animal breathing ... ")
    }
}

let dog = Animal()
dog.breathe()
let person = Person()
person.breathe()

//you can add implementation to a interface function by ((extention))
protocol CanJump{
    func jumping()
    func sitting()
}

extension CanJump{
    func jumping(){
        print("Jumping ... ")
    }
}

// if there is not any extention for the protocols
//you ahve to implement the function in chaild class or structure
struct Cat : CanJump{
    //you dont need implement ((jumping)) method because it has implemented in extention
    //and you have to implement ((sitting)) method
    func sitting() {
        print(" sitting ...")
    }
}
let wiskers = Cat()
wiskers.jumping()


