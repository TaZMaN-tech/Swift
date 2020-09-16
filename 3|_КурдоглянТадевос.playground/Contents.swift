enum EngineStatus {
    case on, off
}

enum WindowsStatus {
    case open, close
}

enum Load {
    case load (volume: Double), unload (volume: Double)
}

struct SportCar {
    let mark: String
    let year: Int
    let startEngine: EngineStatus
    let windowsStatus: WindowsStatus
    let maxVolume: Double
    var filledVolume: Double
    
    mutating func changeTrunk (load: Load) {
        switch load {
        case .load(let volume):
            if volume > maxVolume - filledVolume {
                print("Недостаточно места")
            } else {
                self.filledVolume += volume
                print("Load. Осталось места \(maxVolume - filledVolume)")
            }
        case .unload(let volume):
            if volume > filledVolume {
               print("Ошибка")
           } else {
               self.filledVolume -= volume
               print("Unload. Осталось места \(maxVolume - filledVolume)")
           }
        }
    }
    
    
}

struct TrunkCar {
    let mark: String
    let year: Int
    let startEngine: EngineStatus
    let windowsStatus: WindowsStatus
    let maxVolume: Double
    var filledVolume: Double
    
    mutating func changeTrunk (load: Load) {
       switch load {
       case .load(let volume):
           if volume > maxVolume - filledVolume {
               print("Недостаточно места")
           } else {
               self.filledVolume += volume
               print("Load. Осталось места \(maxVolume - filledVolume)")
           }
       case .unload(let volume):
           if volume > filledVolume {
              print("Ошибка")
          } else {
              self.filledVolume -= volume
              print("Unload. Осталось места \(maxVolume - filledVolume)")
          }
       }
    }
}

var car1 = SportCar (mark: "Ferrary", year: 2015, startEngine: .on, windowsStatus: .close, maxVolume: 100.0, filledVolume: 20.0)

var car2 = TrunkCar (mark: "Kamaz", year: 1984, startEngine: .off, windowsStatus: .open, maxVolume: 700.0, filledVolume: 50.0)

car1.changeTrunk(load: .load (volume: 50))
car1.changeTrunk(load: .unload(volume: 10))

car2.changeTrunk(load: .load(volume: 300))
car2.changeTrunk(load: .unload(volume: 100))
