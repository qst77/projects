/*
 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
 2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
 */
import Foundation

enum FuelType{
    case disel, gasoline, gas
}

enum RefuelingError :Error{
    case wrongFuelType
    case tooMuchFuel
}

class Car {
    var model :String
    var fuel :FuelType
    var tankVolume :Int
    var currentFuelVolume : Int = 0
    
    init?(model :String, fuel :FuelType, tankVolume :Int, currentFuelVolume :Int) {
        self.model = model
        self.fuel = fuel
        self.tankVolume = tankVolume
        self.currentFuelVolume = currentFuelVolume
        guard currentFuelVolume < tankVolume else {
            return nil
        }
    }
    
    func refueling(fuel :FuelType, volume :Int) -> (Int?, RefuelingError?){
        guard self.fuel == fuel else{
            return(nil, RefuelingError.wrongFuelType)
        }
        guard (self.currentFuelVolume + volume) <= self.tankVolume else{
            return(nil, RefuelingError.tooMuchFuel)
        }
        
        self.currentFuelVolume += volume
        return(self.currentFuelVolume, nil)
        
    }
    
    func refuelingThrow(fuel :FuelType, volume :Int) throws {
        guard self.fuel == fuel else{
            throw RefuelingError.wrongFuelType
        }
        
        guard (self.currentFuelVolume + volume) <= self.tankVolume else{
            throw RefuelingError.tooMuchFuel
        }
        
        self.currentFuelVolume += volume
        
    }
    
}

var car1 = Car(model: "Mercedes", fuel: .disel, tankVolume: 100, currentFuelVolume: 20)
var car2 = Car(model: "Honda", fuel: .gasoline, tankVolume: 80, currentFuelVolume: 10)
var car3 = Car(model: "Toyota", fuel: .gas, tankVolume: 75, currentFuelVolume: 80)
var car4 = Car(model: "Lexus", fuel: .gas, tankVolume: 70, currentFuelVolume: 50)

var refuelResultCar1 = car1?.refueling(fuel: .gasoline, volume: 10)


if let resultFuel = refuelResultCar1?.0 {
    print("Автомобиль заправлен")
} else if let resultFuelError = refuelResultCar1?.1{
    print("Причина того, что заправка завершилась неудачно: \(resultFuelError)")
}


do{
    
    try car2?.refuelingThrow(fuel: .gasoline, volume: 120)
} catch RefuelingError.wrongFuelType{
    print("Неправильный тип топлива!")
} catch RefuelingError.tooMuchFuel{
    print("Слишком много пытаетесь залить топлива, объема бака автомобиля недостаточно")
}





