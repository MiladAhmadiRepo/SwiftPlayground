import Foundation

//function with input arguments and default value and return value
func addNumbers(num1:Int = 5,num2:Int = 10) -> Int
{
    return num1 + num2
}

//access to arguments of function with the labels
print("the value of addNumbers is \(addNumbers(num1: 10, num2: 5))   ")

//---------------------------------------------------------------------------

// add _ undescore before the name of argument of function to use as the
// just internally argument in function and you cannot access these labels when you want to call the function
func subNums(_ num1 : Int,_ num2 : Int )-> Int
{
    return num1 - num2;
}
print("the value of sunnums is \(subNums(10, 5))   ")

//---------------------------------------------------------------------------

//use two names together as external and internal lable when you create a function .
//interally  lable would be used as arguments into function
//externally lable would be used as arguments outside of function when ever you want to call a function
func multiplyNums( externalNum1 internalNum1 : Int, externalNum2 internalNum2 : Int )-> Int
{
    return internalNum1 * internalNum2;
}
print("the value of multiplyNums is \(multiplyNums(externalNum1: 5, externalNum2: 5))   ")
