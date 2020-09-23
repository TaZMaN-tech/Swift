enum EngineStatus {
    case on, off
}

enum WindowsStatus {
    case open, close
}

enum Load {
    case load (volume: Double), unload (volume: Double)
}


enum SportCarHatchState {
    case open, close
}

enum IsTrailerkAttached {
    case yes, no
}

class Car {
    let mark: String
    let year: Int
    let startEngine: EngineStatus
    let windowsStatus: WindowsStatus
    let maxVolume: Double
    var filledVolume: Double
    
    init(mark: String, year: Int, startEngine: EngineStatus, windowsStatus: WindowsStatus, maxVolume: Double, filledVolume: Double) {
        self.mark = mark
        self.year = year
        self.startEngine = startEngine
        self.windowsStatus = windowsStatus
        self.maxVolume = maxVolume
        self.filledVolume = filledVolume
    }
    
    func changeEngine (state: EngineStatus) {
        if state == startEngine {
            print("Ошибка")
        }
    }
    
    func changeTrunk (load: Load) {
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
   
    func printCar () -> String {
        var line = ""
        line += "Mark: \(self.mark)\nYear: \(self.year)\nStartEngine: \(self.startEngine)\nWindowsStatus: \(self.windowsStatus)\nMaxVolume: \(self.maxVolume)\nFilledVolume: \(self.filledVolume)"
        return line
    }
}

class SportCar: Car {
    var hatchState: SportCarHatchState
    
    init(mark: String, year: Int, startEngine: EngineStatus, windowsStatus: WindowsStatus, maxVolume: Double, filledVolume: Double, hatchState: SportCarHatchState) {
        self.hatchState = hatchState
        super.init(mark: mark, year: year, startEngine: startEngine, windowsStatus: windowsStatus, maxVolume: maxVolume, filledVolume: filledVolume)
    }
    
    override func printCar() -> String {
        var line = super.printCar()
        line += "\nHatchState: \(self.hatchState)"
        return line
    }
    
    override func changeEngine(state: EngineStatus) {
        super.changeEngine(state: state)
        print("Переключитесь на спортивный режим")
    }
    
    func openHatch() {
            hatchState = .open
        }

    func closeHatch() {
            hatchState = .close
    }
}

class TrunkCar: Car {
    var statusTrailerAttached: IsTrailerkAttached
    
    init(mark: String, year: Int, startEngine: EngineStatus, windowsStatus: WindowsStatus, maxVolume: Double, filledVolume: Double, statusTrailerAttached: IsTrailerkAttached) {
        self.statusTrailerAttached = statusTrailerAttached
        super.init(mark: mark, year: year, startEngine: startEngine, windowsStatus: windowsStatus, maxVolume: maxVolume, filledVolume: filledVolume)
    }
    
    override func printCar() -> String {
        var line = super.printCar()
        line += "\nStatusTrailerAttached: \(self.statusTrailerAttached)"
        return line
    }
    
    override func changeEngine(state: EngineStatus) {
        super.changeEngine(state: state)
        print("Переключитесь на на пониженную передачу")
    }
    
    func trailerOn() {
            statusTrailerAttached = .yes
        }

    func trailerOff() {
            statusTrailerAttached = .no
    }
}

var car1 = SportCar(mark: "Ferrary", year: 2018, startEngine: .on, windowsStatus: .close, maxVolume: 150, filledVolume: 50, hatchState: .close)
car1.changeEngine(state: .on)
car1.changeTrunk(load: .load(volume: 200))
print(car1.printCar())

var car2 = TrunkCar(mark: "Kamaz", year: 1988, startEngine: .off, windowsStatus: .open, maxVolume: 600, filledVolume: 100, statusTrailerAttached: .yes)
car2.changeEngine(state: .off)
car2.changeTrunk(load: .load(volume: 400))
print(car2.printCar())
