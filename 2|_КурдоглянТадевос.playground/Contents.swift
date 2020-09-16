import UIKit

//! 1 задание

func evenNumb (numb: Int) {
    if numb % 2 == 0 {
        print("число четное")
    } else {
        print("число нечетное")
    }
}

evenNumb(numb: 9)


//2 задание

func numb (numb: Int) -> Bool {
    return numb % 3 == 0
}

numb(numb: 5)


//3 задание

var array = [Int]()
for i in 1...100 {
    array.append(i)
}
 print(array)

// 4 задание

let evenArray = array.filter{ $0 % 2 != 0 && $0 % 3 == 0}
print(evenArray)


//5 задание
array = [0,1]
for i in 2...50 {
    array.append(array[i-1] + array[i-2])
}
print(array)

//6 задание
var n = 100
array = Array(2...n)
var p = 2

for i in 0..<array.count {
    p = array[i]
    if p != 0 {
        var j = i + p
        while j < n {
            array[j] = 0
            j += p
            
        }
    }
}
array = array.filter{ $0 != 0}
print(array)
