var optionalInt: Int?
var optionalName: String? = "Bob"

//print ("Hello " + optionalName!)
/*--------------------------------------------------*/

//var nickname: String? = "Jone"
//print ("Hello " + nickname!)
/*--------------------------------------------------*/

//var nickname: String?
//if let nick = nickname {
//    print ("Hello " + nick)
//}
//else {
//    print ("Hello nobody")
//}
/*--------------------------------------------------*/

var nickname: String? = "Jone"
func greet (nickname: String?) {
    guard let nick = nickname else {
        print ("Hello nobody")
        return
    }
    print ("Hello " + nick)
}
greet (nickname: nickname)
/*--------------------------------------------------*/

class Car {
    var brand: String
    init (brand: String) {
        self.brand = brand
    }
}

var optionalCar: Car?
if let brand = optionalCar?.brand {
    print ("Car brand: \(brand)")
}
else {
    print ("Car brand: Unknown")
}

optionalCar = Car(brand: "Volvo")
if let brand = optionalCar?.brand {
    print ("Car brand: \(brand)")
}
else {
    print ("Car brand: Unknown")
}
/*--------------------------------------------------*/

var name: String?
var unwrapped_name = name ?? "default name"
print (unwrapped_name)

name = "Bob"
unwrapped_name = name ?? "default name"
print (unwrapped_name)
/*--------------------------------------------------*/

//Swift Date Reference
import Foundation
var dFormatter = DateFormatter()
var today = Date()

dFormatter.dateFormat = "dd-MMM-yyyy HH:mm"
print (dFormatter.string(from: today))

dFormatter.dateFormat = "dd-MMM-yyyy h:mm a"
print (dFormatter.string(from: today))

dFormatter.dateFormat = "dd-MMM-yyyy HH:mm"
var newDate =  dFormatter.date(from: "01-Feb-2020 12:30")

dFormatter.dateFormat = "dd-MMM-yyyy h:mm a"
if let nd = newDate {
    print (dFormatter.string(from: nd))
}
/*--------------------------------------------------*/

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

var homeworkList: [Homework] = []
dFormatter.dateFormat = "dd-MMM-yyyy"
homeworkList.append (Homework(title: "Homework1", desc: nil, due: nil))
homeworkList.append (Homework(title: "Homework2", desc: nil, due: dFormatter.date(from: "23-Jan-2020")))
homeworkList.append (Homework(title: "Homework3", desc: nil, due: nil))
homeworkList.append (Homework(title: "Homework4", desc: nil, due: dFormatter.date(from: "25-Jan-2020")))
homeworkList.append (Homework(title: "Homework5", desc: nil, due: dFormatter.date(from: "02-Jan-2020")))
homeworkList.append (Homework(title: "Homework6", desc: nil, due: dFormatter.date(from: "12-Jan-2020")))

func sortHomeworkArray (_ homeworkList: inout [Homework]) {
    let n = homeworkList.count
    for i in 0 ..< n-1 {
        for j in 0 ..< n-1-i {
            if let due1 = homeworkList[j].dueDate {
                if let due2 = homeworkList[j+1].dueDate {
                    if due1 > due2 {
                        let temp = homeworkList[j]
                        homeworkList[j] = homeworkList[j+1]
                        homeworkList[j+1] = temp
                    }
                }
            }
            else {
                if let _ = homeworkList[j+1].dueDate {
                    let temp = homeworkList[j]
                    homeworkList[j] = homeworkList[j+1]
                    homeworkList[j+1] = temp
                }
            }
        }
    }
}
sortHomeworkArray (&homeworkList)

for homework in homeworkList {
    reportHomeworkStatus(homework: homework)
    print()
}
/*--------------------------------------------------*/
