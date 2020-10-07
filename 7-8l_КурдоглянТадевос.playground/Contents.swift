class Robot {
    var map: [[Int]] = [
        [1,1,1,1,1,1,1,1,1,1],
        [1,1,0,0,0,0,0,0,1,1],
        [1,0,1,1,1,1,1,1,0,1],
        [1,0,1,1,0,0,1,1,0,1],
        [1,0,1,0,1,1,0,1,0,1],
        [1,0,1,0,1,1,0,1,0,1],
        [1,0,1,1,0,0,1,1,0,1],
        [1,0,1,1,1,1,1,1,0,1],
        [1,1,0,0,0,0,0,0,1,1],
        [1,1,1,1,1,1,1,1,1,1],
    ]
    
    var col: Int
    var row: Int
    var direction: RobotDirection
    var power: Int
    var light: LightStatus
    
    init(row: Int, col: Int, direction: RobotDirection, power: Int, light: LightStatus) {
        self.col = col
        self.row = row
        self.direction = direction
        self.power = power
        self.light = light
    }
    
    func turnLeft () throws -> RobotDirection {
        if power < 1 {
            throw RobotError.lowPower
        }
        power -= 1
        if direction == .up {
            direction = .left
        } else if direction == .left {
            direction = .down
        } else if direction == .down {
            direction = .right
        } else {
            direction = .up
        }
        return direction
    }
    
    func turnRight () throws -> RobotDirection {
        if power < 1 {
            throw RobotError.lowPower
        }
        power -= 1
        if direction == .up {
            direction = .right
        } else if direction == .right {
            direction = .down
        } else if direction == .down {
            direction = .left
        } else {
            direction = .up
        }
        return direction
    }
    
    func print() {
        for (i, row) in map.enumerated() {
            for (j, v) in row.enumerated() {
                if i == self.row && j == self.col {
                    Swift.print("#", terminator:"")
                } else {
                    Swift.print(v == 1 ? "⌺" : " ", terminator: "") // ⌺
                }
            }
            Swift.print()
        }
    }
    
    func step () throws {
        if power < 2 {
            throw RobotError.lowPower
        }
        power -= 2
        if direction == .right {
            if map[row][col + 1] == 1 {
                throw RobotError.wallAHead
            }
            col += 1
        } else if direction == .down {
            if map[row + 1][col] == 1 {
                throw RobotError.wallAHead
            }
            row += 1
        } else if direction == .left {
            if map[row][col-1] == 1 {
                throw RobotError.wallAHead
            }
            col -= 1
        } else {
            if map[row - 1][col] == 1 {
                throw RobotError.wallAHead
            }
            row -= 1
        }
    }
    
    func switchLight () -> (LightStatus?, RobotError?) {
        guard power > 0 else {
            return (nil, RobotError.lowPower)
        }
        power -= 1
        if light == .on {
            light = .off
        } else {
            light = .on
        }
        return (light, nil)
    }

}

enum RobotDirection {
    case up
    case down
    case left
    case right
}

enum RobotError: Error {
    case wallAHead
    case lowPower
}

enum LightStatus {
    case on
    case off
}

var r = Robot.init(row: 1, col: 2, direction: .right, power: 100, light: .off)
r.print()

do {
    try r.turnRight()
    try r.step()
    r.print()
} catch RobotError.wallAHead {
    print("ошибка, там стена")
} catch RobotError.lowPower {
    print("ошибка, недостаточно энергии")
}

var r2 = Robot.init(row: 1, col: 2, direction: .left, power: 0, light: .on)

let r2Light = r2.switchLight()

if let lightR2 = r2Light.0 {
    print("переключили фонари на: \(lightR2)")
} else if let error = r2Light.1 {
    print("ошибка: \(error)")
}
