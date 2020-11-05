/* 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести сами объекты в консоль.*/

import Foundation

enum Colors{
    case black, white, red, yellow
}

enum BodyType {
    case hatchback, sedan, coupe, crossover
}

enum WindowState{
    case open, close
}

enum EngineState{
    case on, off
}

enum TruckType{
    case refrigerator, dump, lorry, road_train
}


protocol Car {
    var mark :String { get }
    var horsePower :Int { get }
    var seatsCount :Int { get }
    var carMass :Int { get }
    var color :Colors { get set }
    var windowState :WindowState { get set }
    var engineState :EngineState { get set }
    func changeColor (newColor :Colors)
}

extension Car  {
    mutating func windowAction(action :WindowState){
        switch action {
        case .close:
            self.windowState = .close
            print("Окна закрыты!")
        case .open:
            self.windowState = .open
            print("Окна открыты")
        default:
            print("Нияего не случилось")
        }
    }
    mutating func engineAction(action :EngineState){
        switch action {
        case .on:
            self.engineState = .on
            print("Двигатель запущен!")
        case .off:
            self.engineState = .off
            print("Двигатель заглушен")
        default:
            print("Ничего не случилось")
        }
    }
}

class SportCar: Car{
    var mark :String
    var horsePower: Int
    var seatsCount: Int
    var carMass: Int
    var color: Colors
    var engineState: EngineState
    var windowState: WindowState
    
    var isHatch :Bool
    var body :BodyType
    
    func changeColor(newColor: Colors) {
        self.color = newColor
        print ("Цвет транспортного средства изменен на \(self.color)")
    }
    
//    func printSportCar(){
//        print("Марка: \(self.mark), л.с: \(self.horsePower), посадочных мест: \(self.seatsCount), масса: \(self.carMass), цвет:\(self.color), двигатель: \(self.engineState), окна:\(self.windowState) люк: \(self.isHatch), тип кузова: \(self.body)")
//    }
    
    init(mark :String, horsePower :Int, seatsCount :Int, carMass :Int, color :Colors, isHatch :Bool, body :BodyType, engineState :EngineState, windowState :WindowState) {
        self.mark = mark
        self.horsePower = horsePower
        self.seatsCount = seatsCount
        self.carMass = carMass
        self.color = color
        self.isHatch = isHatch
        self.body = body
        self.engineState = engineState
        self.windowState = windowState
    }
    
    
}
extension SportCar :CustomStringConvertible{
    var description: String {
        return "Марка: \(self.mark), л.с: \(self.horsePower), посадочных мест: \(self.seatsCount), масса: \(self.carMass), цвет:\(self.color), двигатель: \(self.engineState), окна:\(self.windowState) люк: \(self.isHatch), тип кузова: \(self.body)"
    }
    
    
}

class TruckCar: Car{
    var mark :String
    var horsePower: Int
    var seatsCount: Int
    var carMass: Int
    var color: Colors
    var engineState: EngineState
    var windowState: WindowState
    
    var type :TruckType
    
    
    func changeColor(newColor: Colors) {
        self.color = newColor
        print ("Цвет транспортного средства изменен на \(self.color)")
    }
    

    
    init(mark :String, horsePower :Int, seatsCount :Int, carMass :Int, color :Colors, type :TruckType, engineState :EngineState, windowState :WindowState) {
        self.mark = mark
        self.horsePower = horsePower
        self.seatsCount = seatsCount
        self.carMass = carMass
        self.color = color
        self.type = type
        self.engineState = engineState
        self.windowState = windowState
    }
    
    
}

extension TruckCar :CustomStringConvertible{
    var description: String {
        return "Марка: \(self.mark), л.с: \(self.horsePower), посадочных мест: \(self.seatsCount), масса: \(self.carMass), цвет:\(self.color), двигатель: \(self.engineState), окна:\(self.windowState) , тип грузовика: \(self.type)"
    }
    
    
}


var car1 = SportCar(mark: "Honda", horsePower: 249, seatsCount: 5, carMass: 1900, color: .black, isHatch: true, body: .sedan, engineState: .off, windowState: .close)

print(car1)
car1.changeColor(newColor: .white)
print(car1)
car1.windowAction(action: .open)

var truck1 = TruckCar(mark: "Volvo", horsePower: 500, seatsCount: 3, carMass: 5000, color: .black, type: .dump, engineState: .off, windowState: .close)

print(truck1)
truck1.changeColor(newColor: .red)
print(truck1)
truck1.engineAction(action: .on)
    



