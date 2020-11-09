/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */
import Foundation

protocol Mileageble{
    var mileage :Int { get set }
}
enum Carbody{
    case coupe, crossover, sedan, hatchback
}
enum Mototype{
    case racing, travel, trial //тип мотоцикла
}

class Moto :Mileageble{
    var mark :String
    var type :Mototype
    var maxSpeed :Int
    var mileage :Int
    
    init(mark :String, type :Mototype, maxSpeed :Int, mileage :Int) {
        self.mark = mark
        self.type = type
        self.maxSpeed = maxSpeed
        self.mileage = mileage
    }
}

extension Moto :CustomStringConvertible{
    var description: String{
        return "Марка: \(mark), Тип мотоцикла: \(type), Максимальная скорость: \(maxSpeed) км/ч, Пробег:\(self.mileage)\n"
    }
}

class Car :Mileageble {
    var mark :String
    var horsePower :Int
    var bodyType :Carbody
    var mileage :Int
    
    init (mark :String, horsePower :Int, bodyType :Carbody, mileage :Int){
        self.mark = mark
        self.horsePower = horsePower
        self.bodyType = bodyType
        self.mileage = mileage
    }
    
}

extension Car :CustomStringConvertible{
    var description: String{
        return "Марка: \(self.mark), Мощность: \(self.horsePower) л/с, Тип кузова: \(self.bodyType),  Пробег: \(self.mileage) миль\n"
    }
}

struct Queue<T :Mileageble>{
    private var elements: [T] = []
    
    mutating func push(_ element :T){
        elements.append(element)
    }
    
    mutating func pop() -> T{
        return elements.removeFirst()
    }
    
    func summaryMileage() -> Int{
        var summileage = 0
        elements.forEach{summileage += $0.mileage}
        return summileage
    }
    
    subscript(index :Int) -> T?{
        guard elements.count > 0, index < elements.count, index >= 0 else{
          
            return nil
        }
        
        return elements[index]
    }
    
}

var queueCars = Queue<Car>()
var queueMoto = Queue<Moto>()

var car1 = Car(mark: "Honda", horsePower: 190, bodyType: .coupe, mileage: 100000)
var car2 = Car(mark: "Toyota", horsePower: 250, bodyType: .sedan, mileage: 5000)
var car3 = Car(mark: "Mercedes", horsePower: 300, bodyType: .crossover, mileage: 10000)
var car4 = Car(mark: "Volvo", horsePower: 140, bodyType: .coupe, mileage: 123000)
var moto1 = Moto(mark: "Suzuki", type: .racing, maxSpeed: 350, mileage: 2000)
var moto2 = Moto(mark: "Harley", type: .travel, maxSpeed: 200, mileage: 50000)
var moto3 = Moto(mark: "Honda", type: .trial, maxSpeed: 150, mileage: 15000)

queueCars.push(car1)
queueCars.push(car2)
queueCars.push(car3)
queueCars.push(car4)



queueCars.pop()
print(queueCars)

queueMoto.push(moto1)
queueMoto.push(moto2)
queueMoto.push(moto3)

queueMoto.pop()
print(queueMoto)

print ("Суммарный пробег всех машин: \(queueCars.summaryMileage())")
print ("Суммарный пробег всех мотоциклов: \(queueMoto.summaryMileage())")


print(queueCars[0] as! Car)
print(queueCars[5])
