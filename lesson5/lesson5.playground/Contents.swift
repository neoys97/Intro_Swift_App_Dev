protocol SomeProtocol {
    // protocol definition
}

protocol AnotherProtocol {
    // protocol definition
}
/*--------------------------------------------------*/

struct SomeStruct: SomeProtocol, AnotherProtocol {
    // struct definition
}
/*--------------------------------------------------*/

class SuperClass {
    // super class definition
}

class SomeClass: SuperClass, SomeProtocol, AnotherProtocol {
    // class definition
}
/*--------------------------------------------------*/

protocol Saleable {
    var price: Double {get set}
    var discount: Double? {get set}
    
    func getPrice () -> Double
}

struct Toy: Saleable {
    var price: Double
    var discount: Double?
    
    var name: String
    var brand: String
    init (name: String, brand: String, price: Double = 0.0, discount: Double? = nil) {
        self.name = name
        self.brand = brand
        self.price = price
        self.discount = discount
    }
    
    func getPrice() -> Double {
        if let d = discount {
            return (price * (1 - d))
        }
        return price
    }
}

struct Car: Saleable{
    var price: Double
    var discount: Double?
    
    var brand: String
    var numOfWheels: Int
    
    init (brand: String, numOfWheels: Int, price: Double = 0.0, discount: Double? = nil) {
        self.brand = brand
        self.numOfWheels = numOfWheels
        self.price = price
        self.discount = discount
    }
    
    func getPrice() -> Double {
        if let d = discount {
            return (price * (1 - d))
        }
        return price
    }
}

var saleGoods: [Saleable] = []
saleGoods.append (Toy(name: "EV3", brand: "Lego", price: 2300.00, discount: 0.1))
saleGoods.append (Car(brand: "Volvo", numOfWheels: 4, price: 305000, discount: 0.3))

for good in saleGoods {
    print (good.getPrice())
}
/*--------------------------------------------------*/

struct Position: Equatable, Hashable {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

let availablePositions = [Position(0, 0), Position(0, 1), Position(1, 0)]
let gemPosition = Position(1, 0)

for position in availablePositions {
    if gemPosition == position {
        print("Gem found at (\(position.x), \(position.y))!")
    } else {
        print("No gem at (\(position.x), \(position.y))")
    }
}
/*--------------------------------------------------*/

class Player {
    var name: String
    var position: Position
    
    init(name: String, position: Position) {
        self.name = name
        self.position = position
    }
}

extension Player: Equatable {
    static func ==(lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name && lhs.position == rhs.position
    }
}

extension Player: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(position)
    }
}
/*--------------------------------------------------*/

import Foundation

class Homework {
    var title: String
    var desc: String?
    var dueDate: Date?
    
    init (title: String, desc: String? = nil, due dueDate: Date? = nil) {
        self.title = title
        self.desc = desc
        self.dueDate = dueDate
    }
}

func reportHomeworkStatus (homework: Homework) {
    let dFormatter = DateFormatter()
    dFormatter.dateFormat = "dd-MMM-yyyy HH:mm"
    var dueString = "empty"
    if let due = homework.dueDate {
        dueString = dFormatter.string(from: due)
    }
    let description = homework.desc ?? "empty"
    print ("""
        Title:\t\t\t\(homework.title)
        Description:\t\(description)
        Due Date:\t\t\(dueString)
        """)
}

let dFormatter = DateFormatter()
var homeworkList: [Homework] = []
dFormatter.dateFormat = "dd-MMM-yyyy"
homeworkList.append (Homework(title: "Homework1", desc: nil, due: nil))
homeworkList.append (Homework(title: "Homework2", desc: nil, due: dFormatter.date(from: "23-Jan-2020")))
homeworkList.append (Homework(title: "Homework3", desc: nil, due: nil))
homeworkList.append (Homework(title: "Homework4", desc: nil, due: dFormatter.date(from: "25-Jan-2020")))
homeworkList.append (Homework(title: "Homework5", desc: nil, due: dFormatter.date(from: "02-Jan-2020")))
homeworkList.append (Homework(title: "Homework6", desc: nil, due: dFormatter.date(from: "12-Jan-2020")))

extension Homework: Comparable {
    static func < (lhs: Homework, rhs: Homework) -> Bool {
        if let due1 = lhs.dueDate {
            if let due2 = rhs.dueDate {
                return due1 < due2
            }
            else {
                return true
            }
        }
        else {
            if let _ = rhs.dueDate {
                return false
            }
            else {
                return true
            }
        }
    }
    
    static func == (lhs: Homework, rhs: Homework) -> Bool {
        if let due1 = lhs.dueDate, let due2 = rhs.dueDate {
            return due1 == due2
        }
        else if lhs.dueDate == nil && rhs.dueDate == nil {
            return true
        }
        else {
            return false
        }
    }
}

homeworkList.sort()

for homework in homeworkList {
    reportHomeworkStatus(homework: homework)
    print()
}
/*--------------------------------------------------*/
