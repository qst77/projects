import Foundation
//task 1 - решение квадратного уравнения
let a = 3.0
let b = 10.0
let c = 3.0

let D = b * b - 4 * a * c

if (D < 0) {
    print ("Корней над полем действительным чисел нет!")
} else{
    if (D == 0){
        var x = -b / (2 * a)
        print ("корень уравнения: \(x)")
    } else {
        
        var x1 = (-b + sqrt(D))/(2 * a)
        x1 = round(100 * x1) / 100
        var x2 = (-b - sqrt(D))/(2 * a)
        x2 = round(100 * x2) / 100
        print ("1 корень уравнения: \(x1) , 2 корень уравнения: \(x2)")
        
    }
}

//task 2 - треугольник

let catetA = 10.0
let catetB = 5.0
var gipotenusa = sqrt(catetA * catetA + catetB * catetB)
gipotenusa = round (100 * gipotenusa) / 100
var perimetr = catetB + catetA + gipotenusa
perimetr = round (100 * perimetr) / 100
var area = catetA * catetB / 2
area = round (100 * area) / 100
print ("Гипотенуза: \(gipotenusa), площадь \(area) и периметр \(perimetr) треугольника со сторонами: \(catetA) и \(catetB)")

//task 3 - вклад

let startCapital = 1_000_000.0
let percent = 5.0
let years = 5

var income = startCapital
var currentYear = 1;

while currentYear <= years {
    income = income * (1 + percent/100)
    currentYear+=1
}

income = round (100 * income) / 100

print ("С вкладом в \(startCapital) под \(percent) процентов годовых через \(years) лет Вы получите доход в размере \(income)")




