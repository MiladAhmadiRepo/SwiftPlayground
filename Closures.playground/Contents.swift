import Foundation

//define a variable as function type and set a value for that
let add : (Int , Int) -> Int = {
    (lhs : Int , hls :Int) -> Int in
    lhs + hls
}
add(20,10)
 


func addCustom(_ lhs : Int ,_ hls : Int,
                ExternalNameFunction internalNameUsing : (Int ,Int) -> Int
)-> Int{
    internalNameUsing(	lhs , hls)
}

// you can find the simple way to set argumets for this function on the next example
addCustom(05 , 20, ExternalNameFunction:{ (lhs : Int , rhs : Int) -> Int in
        lhs + rhs
    }
)

// you can change trailing item in swift
// first remove the last item in input arguments
// as ((trailing closure syntax))
// then remove the externalName also remove the types of passing arguments function and remove the return type of function
// which makes your closure parameter very easy to read
addCustom(20, 10) { lhs, rls in
    lhs+rls
}


//also the simplest way to set value for the last argument of a function ,you can use aruments index
// like this
addCustom(30, 30) {
    $0+$1
}



