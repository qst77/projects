import Foundation

enum doorState{
    case open, close
}

enum windowState{
    case open, close
}

enum engineState{
    case on, off
}

enum cargoAction{
    case load, unload
}

enum Drive{ //привод (задний, передний, полный)
    case backDrive, frontDrive, fullDrive
}

class Car{
    var mark :String
    var year :Int
    var horsePower :Int
    var color :String
    var doorCarState :doorState
    var windowCarState :windowState
    var engineCarState :engineState
    var filledVolumeCargo :Int
    var maxVolumeCargo :Int
    
    init(mark :String, year :Int, horsePower :Int, color :String, doorCarState :doorState, windowCarState :windowState, engineCarState :engineState, filledVolumeCargo :Int, maxVolumeCargo :Int) {
        self.mark = mark
        self.year = year
        self.horsePower = horsePower
        self.color = color
        self.doorCarState = doorCarState
        self.windowCarState = windowCarState
        self.engineCarState = engineCarState
        self.filledVolumeCargo = filledVolumeCargo
        self.maxVolumeCargo = maxVolumeCargo
    }
    
    func actionWithEngine(action :engineState){
        switch action {
        case .on:
            print("Двигатель заведен!")
        case .off:
            print("Двигатель заглушен!")
        default:
            print("Ничего не произошло ...")
            break
        }
    }
        
    func actionWithWindow(action :windowState){
            switch action {
            case .open:
                print("Окна открыты!")
            case .close:
                print("Окна закрыты")
            default:
                print("Ничего не случилось ...")
                break
            }
        }
    func actionWithDoor(action :doorState){
            switch action {
            case .open:
                print("Двери открыты!")
            case .close:
                print("Двери закрыты")
            default:
                print("Ничего не случилось ...")
                break
            }
        }
    
    func actionWithCargo(action :cargoAction, volume :Int){
        switch action {
        case .load:
            self.filledVolumeCargo += volume
            print("Загружено \(volume) л, занято \(self.filledVolumeCargo) из \(self.maxVolumeCargo)")
        case .unload:
            self.filledVolumeCargo -= volume
            print("Выгружено \(volume) л занято \(self.filledVolumeCargo) из \(self.maxVolumeCargo)")
        default:
            print("Ничего не случилось")
            break
        }
    }
    
    
    func makeSignal(){
        
    }
}

class SportCar: Car {
    var sportCarDrive :Drive
    
    init(mark: String, year: Int, horsePower: Int, color: String, doorCarState: doorState, windowCarState: windowState, engineCarState: engineState, filledVolumeCargo: Int, maxVolumeCargo: Int, sportCarDrive :Drive) {
        self.sportCarDrive = sportCarDrive
        super.init(mark: mark, year: year, horsePower: horsePower, color: color, doorCarState: doorCarState, windowCarState: windowCarState, engineCarState: engineCarState, filledVolumeCargo: filledVolumeCargo, maxVolumeCargo: maxVolumeCargo)
    }
    
    func driftStart(){
        switch self.sportCarDrive{
        case .backDrive:
            print("Увеличьте газ, дергайте ручник и поворачивайте руль. Ура, вы дрифтуете, все девочки Ваши!")
        case .frontDrive:
            print("Упс, не получится, нужен задний привод:(")
        case .fullDrive:
            print("Езжайте ка в лес за грибами с Вашим полным приводом)))")
        default:
            print("")
            break
        }
    }
    
    override func makeSignal() {
        print("Ту Туууууу")
    }
}


class TruckCar: Car{
    var refrigeratorIsOnBoard :Bool //наличие рефриджератора в кузове
    
    init(mark: String, year: Int, horsePower: Int, color: String, doorCarState: doorState, windowCarState: windowState, engineCarState: engineState, filledVolumeCargo: Int, maxVolumeCargo: Int, refrigeratorIsOnBoard :Bool) {
        self.refrigeratorIsOnBoard = refrigeratorIsOnBoard
        super.init(mark: mark, year: year, horsePower: horsePower, color: color, doorCarState: doorCarState, windowCarState: windowCarState, engineCarState: engineCarState, filledVolumeCargo: filledVolumeCargo, maxVolumeCargo: maxVolumeCargo)
    }
    
    override func makeSignal() {
        print ("ТА ДАААААААМ ТА ДАААААААМ")
    }
}


let car1 = SportCar(mark: "Honda", year: 2015, horsePower: 249, color: "Black", doorCarState: .close, windowCarState: .close, engineCarState: .off, filledVolumeCargo: 10, maxVolumeCargo: 15, sportCarDrive: .backDrive)

car1.makeSignal()
car1.driftStart()
car1.actionWithDoor(action: .open)
car1.actionWithCargo(action: .load, volume: 2)

let truck1 = TruckCar(mark: "Volvo", year: 2010, horsePower: 300, color: "black", doorCarState: .close, windowCarState: .close, engineCarState: .off, filledVolumeCargo: 20, maxVolumeCargo: 300, refrigeratorIsOnBoard: true)

truck1.makeSignal()
truck1.actionWithCargo(action: .load, volume: 150)
print(truck1.refrigeratorIsOnBoard)




