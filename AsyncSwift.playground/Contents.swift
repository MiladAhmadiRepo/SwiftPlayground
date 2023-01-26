import Foundation
import PlaygroundSupport
import _Concurrency

PlaygroundPage.current.needsIndefiniteExecution = true

func calculateFullName (firstName : String , lastName : String) async -> String{
    try? await Task.sleep(for: .seconds(2))
    return "\(firstName)  \(lastName)"
}
//if you throw before async you can remove ((?)) after ((try))

//to call a async function we have to put the function into Task
Task{
    let result1 = await calculateFullName(firstName: "Foo", lastName: "Bar")
}

Task {
    //you can get a async value into a async variable
    async let result2 = calculateFullName(firstName: "Jee", lastName: "Zoo")
    await result2
}


//------------------------------------------------------
//enum with async function

enum clothe {
    case socks , shirt , trousers
}

func buySocks() async throws -> clothe{
    try await Task.sleep(for: .seconds(1))
    return clothe.socks
}

func buyShirt() async throws -> clothe{
    try await Task.sleep(for: .seconds(1))
        return clothe.shirt
    
}


func buyTrousers() async throws -> clothe{
    try await Task.sleep(for: .seconds(1))
        return clothe.trousers
}


struct Ensemble : CustomDebugStringConvertible {
    
    let clothes : [clothe]
    let totalPrice : Double
    var debugDescription: String {
        "Clothe : \(clothes) - Price : \(totalPrice)"
    }
    
}


func buyHoleEnsemble () async throws -> Ensemble{
    //we put all variables into async variables
    async let socks = await buySocks()
    async let shirt = await buyShirt()
    async let trousers = await buyTrousers()
        //to put all async variable into an array we use await before an array
    let ensemble = Ensemble(clothes: await [try socks , try shirt , try trousers], totalPrice: 200)
    return ensemble
}


//now we use
Task{
    if let ensemble = try? await buyHoleEnsemble(){
        print(ensemble)
    }
    else{
        print("something went wrong")
    }
        
}

//------------------------------------------------------
//pass delay and async function as parameters into a function

func getFullName(
    delay : Duration,
    calculator : () async -> String
)async  -> String{
    try? await Task.sleep(for: delay)
    return await calculator()
}


func fullName () async -> String {"Foo Bar"}

Task{
    await getFullName(delay : .seconds(1) ){
        async let  name = fullName()
        return await name
    }
}
