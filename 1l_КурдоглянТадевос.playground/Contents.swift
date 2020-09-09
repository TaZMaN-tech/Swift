import UIKit

//1 задание x^2-2x-3=0

var a: Double = 1
var b: Double = -2
var c: Double = -3

var d = pow(b,2)-4*a*c

if(d>0){
    let x1 = (-b + sqrt(d))/2*a
    let x2 = (-b - sqrt(d))/2*a
    print(Int(x1), Int(x2))
}

//2 задание
a = 2
b = 3

c = sqrt(pow(a,2) + pow(b,2))
let S = a*b/2
let P = a + b + c
let message = "гипотенуза: " + String(Float(c)) + "; площадь: " + String(Int(S)) + "; периметр: " + String(Float(P)) + "."
print(message)


//3 задание

var deposit = 1346
var percentPerYear = 6

var depositIn5Year = Double(deposit) * pow((1.0 + Double(percentPerYear)/100),5)
print("Сумма вкладка на 5 год составит: " + String(Float(depositIn5Year)))
