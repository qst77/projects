import Foundation


enum engineStatus{
    case on, off
    
}
enum windowStatus{
    case open, close
}

enum doorStatus{
    case open, close
}

enum errorsVehicle{ // возможные поломки которые могут возникнуть в процессе эксплуатации транспортного средства
    case electricity, engine, turbine, conditionSystem, none
}

struct sportCar{
    var mark: String
    var year: Int
    var volume: Int
    var engineCarStatus: engineStatus
    var windowCarStatus: windowStatus
    var filledVolume: Int
    var doorCarStatus: doorStatus
    var carError: errorsVehicle
    
    func printCar() {
        print("Марка: \(self.mark), год выпуска: \(self.year), объем багажника: \(self.volume), состояние двигателя: \(self.engineCarStatus), состояние окон: \(self.windowCarStatus), заполненный объем \(self.filledVolume), состояние дверей: \(self.doorCarStatus), наличие ошибок: \(carError)")
    }
    mutating func turnOnEngine() {
        self.engineCarStatus = .on
        print("Двигатель заведен")
    }
    
    mutating func turnOffEngine() {
        self.engineCarStatus = .off
        print("Двигатель заглушен")
    }
    
    mutating func openWindow() {
        self.windowCarStatus = .open
        print("Окна открыты")
    }
    
    mutating func closeWindow() {
        self.windowCarStatus = .close
        print("Окна закрыты")
    }
    
    mutating func loadCargo(volume :Int){
        self.filledVolume = self.filledVolume + volume
        print ("Загружено \(volume) л в багажник")
    }
    mutating func unloadCargo(volume :Int){
        self.filledVolume = self.filledVolume - volume
        print("Загружено \(volume) в багажник")
    }
    
    mutating func carError (error: errorsVehicle){//двигатель будет заглушаться в случае критическиз проблем; в других случаях - просто предупреждение
        switch error {
        case .electricity:
            print ("Проблемы с электричеством, посетите сервис в ближайшее время")
            self.carError = .electricity
        case .engine:
            print ("С двигателем возникла проблема, отправьтесь на сервис на эвакуаторе, двигатель будет заглушен")
            self.turnOffEngine()
            self.carError = .engine
        case .conditionSystem:
            print("Неполадки с системой кондиционирования, посетите сервис в ближайшее время")
            self.carError = .conditionSystem
        case .turbine:
            print ("С турбиной возникла проблема, отправьтесь на сервис на эвакуаторе, двигатель будет заглушен")
            self.turnOffEngine()
            self.carError = .turbine
        default:
            break
        }
        
    }
    
    init?(mark: String, year :Int, volume :Int, engineCarStatus :engineStatus, windowCarStatus :windowStatus,
          filledVolume :Int, doorCarStatus :doorStatus, carError :errorsVehicle) {
        guard volume > 0 else {
            return nil
        }
        self.mark = mark
        self.year = year
        self.volume = volume
        self.engineCarStatus = engineCarStatus
        self.windowCarStatus = windowCarStatus
        self.filledVolume = 0
        self.doorCarStatus = doorCarStatus
        self.carError = carError
    }
    
}

struct trunkCar{
    var mark: String
    var year: Int
    var volumeTrunk: Int
    var engineTrunkStatus: engineStatus
    var windowTrunkStatus: windowStatus
    var filledVolumeTrunk: Int
    var doorTrunkStatus: doorStatus
    
    
    
    mutating func turnOnEngine() {
        self.engineTrunkStatus = .on
        print("Двигатель заведен")
    }
    
    mutating func turnOffEngine() {
        self.engineTrunkStatus = .off
        print("Двигатель заглушен")
    }
    
    mutating func openWindow() {
        self.windowTrunkStatus = .open
        print("Окна открыты")
    }
    
    mutating func closeWindow() {
        self.windowTrunkStatus = .close
        print("Окна закрыты")
    }
    
    mutating func loadTrunk(volume :Int){
        self.filledVolumeTrunk = self.filledVolumeTrunk + volume
        print ("Загружено \(volume) л в кузов")
    }
    mutating func unloadTrunk(volume :Int){
        self.filledVolumeTrunk = self.filledVolumeTrunk - volume
        print ("Загружено \(volume) л в кузов")
    }
            
    
    mutating func printTrunk() {
        print("Марка грузовика: \(self.mark), год выпуска: \(self.year), объем кузова: \(self.volumeTrunk), состояние двигателя: \(self.engineTrunkStatus), состояние окон: \(self.windowTrunkStatus), заполненный объем \(self.filledVolumeTrunk), состояние дверей: \(self.doorTrunkStatus)")
    }
    
    init?(mark: String, year :Int, volume :Int, engineTrunkStatus :engineStatus, windowTrunkStatus :windowStatus,
         filledVolumeTrunk :Int, doorTrunkStatus :doorStatus) {
        guard volume > 0 else {
            return nil
        }
        self.mark = mark
        self.year = year
        self.volumeTrunk = volume
        self.engineTrunkStatus = engineTrunkStatus
        self.windowTrunkStatus = windowTrunkStatus
        self.filledVolumeTrunk = filledVolumeTrunk
        self.doorTrunkStatus = doorTrunkStatus
    }
    
}


var car1 = sportCar(mark: "Honda", year: 2010, volume:  10, engineCarStatus: .off, windowCarStatus: .open, filledVolume: 10, doorCarStatus: .open, carError: .none)

car1?.printCar()
car1?.turnOnEngine()
car1?.printCar()
car1?.loadCargo(volume: 10)
car1?.printCar()
car1?.carError(error: .turbine)
car1?.printCar()

var trunk1 = trunkCar(mark: "Volvo", year: 2015, volume:  1000, engineTrunkStatus: .off, windowTrunkStatus: .open, filledVolumeTrunk: 100, doorTrunkStatus: .open)
print("\n")
trunk1?.printTrunk()
trunk1?.turnOnEngine()
trunk1?.printTrunk()
trunk1?.loadTrunk(volume: 500)
trunk1?.printTrunk()

