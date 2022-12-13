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


let foo = Person(name: "foo", age: 20)
foo.age
// you can see we asign new value to let variable without any error ((let foo))
// why? beacusse all classes in Swift are ((in refrence types)) and we can change them iternally
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


class Tesla{
    let manufacturer = "Tesla"
    let model :String
    let year : Int
    
    //designated initializer could be implemet multi time with multi shape
    init() {
        model="x"
        year=2023
    }
    
    init(model:String,year:Int) {
        self.model = model
        self.year = year
    }
    //designated initializer could not call in another designated initalizer
    //  init() {
    //      self.init(model : "x" , year : 2023)
    //  }
    //Designated initializer cannot delegate (with 'self.init'); it should be a convenience initializer
 
    
    convenience init (model : String)
    {
        //you can see ((convenience initializer)) delegated ((Designated initializer))
        self.init(model : model , year: 2023)
    }
    
}

class TeslaModelY : Tesla{
    //for ((init )) we have to override ((init)) in super class
    override init(model: String, year: Int) {
        super.init(model: model, year: year)
    }
    
    //you can not call ((convenience initializer)) in ((Designated initializer)) for example in child init method
    //override init(model: String, year: Int) {
        //super.init(model: model)
    //}
    
}


//classes are ((refrences type))
let fooBar = Person2(age: 20)
fooBar.age
func doSomeThing(with person : Person2)
{
    person.increaseAge()
}
doSomeThing(with : fooBar)
fooBar.age


class MyClass{
    init (){
        print("init call" )
    }
    func doSomeThing(){
        print("do some thing")
    }
    //deinit would be call after the object of class remove in memory
    
    deinit{
        print("deinit call")
    }
}

let myclass=MyClass()

let myClosure = {
    let myclass2 = MyClass()
    myclass2.doSomeThing()
}
myClosure()
