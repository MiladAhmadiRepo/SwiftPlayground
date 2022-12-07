import Foundation

class Person {
    var name : String
    var age : Int
    init(name: String , age :Int)
    {
        self.name=name
        self.age=age
    }
    
    func increaseAge(){
        self.age+=1
    }
}

// you can see we asign new value to let variable without any error
// why, beacusse all classes in swift are by refrence types and we can change them iternaly
let foo = Person(name: "foo", age: 20)
foo.age
foo.increaseAge()
foo.age

// you can check refrece type of classes by fill a variable with a class variable
let bar = foo
bar.increaseAge()
//bar and foo refer to the same palace
foo.age
bar.age


//you can compare refrence place with ((===))
if(foo === bar){
    print("foo and bar point to the same memory")}
else{
    print("foo and bar don't point to the same memory")}


//you can have private perporties with ((private)) key word
class Person2 {
    private(set) var age : Int
    init(age : Int){
        self.age = age
    }
    func increaseAge(){
        self.age += 1
    }
}



let person2 : Person2 = Person2(age: 20)
person2.age
person2.increaseAge()
person2.age
//you don't access to change a value of private varibale in class externally
//person2.age+=1


