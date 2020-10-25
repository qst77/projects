import Foundation

// task1 and task2
func delimost (delimoe: Int, delitel: Int) -> Int {

    guard (delitel == 2 || delitel == 3) else { return 2 }
    if (delimoe % delitel == 0){
        return 0
    } else {
        return 1
    }
}
let delimoe = 15
let delitel = 5

var result = delimost(delimoe: delimoe, delitel: delitel)
switch result{
case 0: print ("Число \(delimoe) делится на \(delitel) без остатка")
case 1: print ("Число \(delimoe) не делится на \(delitel) без остатка")
case 2: print ("Ошибка")
default: break
}

//task 3

var values = Array(0...99)

//task 4

var newArray = values.filter{$0 % 2 != 0 && $0 % 3 != 0}

//task 5

func fibonacci (predChislo: Decimal, tekChislo: Decimal) -> Decimal{
    return predChislo + tekChislo
}
var fibonacciArray: [Decimal] = [0,1]

var fibonacciCount = 2

while fibonacciCount <= 100{
    fibonacciArray.append(fibonacci(predChislo: fibonacciArray[fibonacciCount-1], tekChislo: fibonacciArray[fibonacciCount-2]))
    fibonacciCount += 1
}
 print (fibonacciArray)

//task 6
var min = 2
var max = 100
var prostArray = Array(min...max)
var nextIndex = 0
var nextNumber = prostArray[nextIndex]

while (nextNumber <= Int(sqrt(Double(max)))){
    prostArray.removeAll(where: {$0 % nextNumber == 0 && $0 != nextNumber})
    nextIndex += 1
    nextNumber = prostArray[nextIndex]
}
print (prostArray)



