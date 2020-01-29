// function without return value
func greet (person: String) {
    print ("Hello \(person)")
}
greet (person: "Bob")

// function with return value
func findAreaOfRect (length: Double, width: Double) -> Double {
    return length * width
}
let area =  findAreaOfRect(length: 15.0, width: 9.0)
print ("The area of rectangle is \(area)")
/*--------------------------------------------------*/

var sum = 0

// function with different argument labels and parameter names
func findSum (from firstNumber: Int, to secondNumber: Int) -> Int {
    var result = 0
    for i in firstNumber...secondNumber {
        result += i
    }
    return result
}
sum =  findSum (from: 5, to: 10)
print ("Result is \(sum)")

// function with the same argument labels and parameter names
func findSum (firstNumber: Int, secondNumber: Int) -> Int {
    var result = 0
    for i in firstNumber...secondNumber {
        result += i
    }
    return result
}
sum =  findSum (firstNumber: 5, secondNumber: 10)
print ("Result is \(sum)")

// function without argument label
func findSum (_ firstNumber: Int, _ secondNumber: Int) -> Int {
    var result = 0
    for i in firstNumber...secondNumber {
        result += i
    }
    return result
}
sum =  findSum (5, 10)
print ("Result is \(sum)")
/*--------------------------------------------------*/

func findSumAndReport (from firstNumber: Int, to secondNumber: Int, how printer: (Int) -> Void ) {
    var result = 0
    for i in firstNumber...secondNumber {
        result += i
    }
    printer (result)
}

func printResult (number: Int) {
    print ("The result is \(number)")
}

findSumAndReport(from: 3, to: 25, how: printResult)
/*--------------------------------------------------*/

// initialisation of an array
var listOfFruits: [String] = ["grapes", "oranges", "apples", "pineapples"]

// iterate through items in an array
for fruit in listOfFruits {
    print (fruit)
}

// add item to an array
listOfFruits.append("lemons")

// delete item from an array
listOfFruits.remove(at: 0)

// refer to Swift documentation for more array class method
/*--------------------------------------------------*/

// initialisation of an dictionary
var nameAgeDict: [String: Int] = ["John": 18, "Bob": 23, "Johnson": 8]

// iterate through items in dictionary
for (name, age) in nameAgeDict {
    print ("\(name) is \(age) years old")
}

// add item to a dictionary
nameAgeDict["Jenny"] = 5

// delete item from a dictionary
nameAgeDict.removeValue(forKey: "Johnson")

// refer to Swift documentation for more dictionary class method
/*--------------------------------------------------*/

enum Direction {
    case north, east, south, west
}

var direction: Direction = .east

if direction == .east {
    print ("Going in the right direction")
}
else {
    print ("Wrong way")
}

switch direction {
    case .east:
        print ("Going east")
    case .north:
        print ("Going north")
    case .south:
        print ("Going south")
    case .west:
        print ("Going west")
}
/*--------------------------------------------------*/

var originalValue = 10

func add10 (number: Int) {
    var value = number
    value += 100
    print ("Value in function is \(value)")
}

print ("Original value before function call is \(originalValue)")
add10 (number: originalValue)
print ("Original value after function call is \(originalValue)")

func add10ByRef (number: inout Int) {
    number += 100
    print ("Value in function is \(number)")
}

print ("Original value before function call is \(originalValue)")
add10ByRef(number: &originalValue)
print ("Original value after function call is \(originalValue)")
/*--------------------------------------------------*/

func sortIntegerArray (_ numbers: inout [Int]) {
    let n = numbers.count
    for i in 0 ..< n-1 {
        for j in 0 ..< n-1-i {
            if numbers[j] > numbers[j+1] {
                let temp = numbers[j]
                numbers[j] = numbers[j+1]
                numbers[j+1] = temp
            }
        }
    }
}

var listOfNumbers = [10, 9, 8, 1, 4, 6, 7, 2]
print ("Unsorted list: \(listOfNumbers)")

sortIntegerArray(&listOfNumbers)
print ("Sorted list: \(listOfNumbers)")
/*--------------------------------------------------*/

import Dispatch

func measurePerformance (_ sort: (inout [Int]) -> Void) {
    var listOfNumbers = [10, 9, 8, 1, 4, 6, 7, 2]
    let start = DispatchTime.now()
    sort (&listOfNumbers)
    let end = DispatchTime.now()
    
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print ("It takes \(timeInterval) seconds to run the function")
}

measurePerformance(sortIntegerArray)
/*--------------------------------------------------*/

func decimalToBinary (_ number: Int) -> String {
    var binary = ""
    var value = number
    while value != 0 {
        binary = String (value % 2) + binary
        value /= 2
    }
    return binary == "" ? "0" : binary
}

decimalToBinary(20)
decimalToBinary(0)
decimalToBinary(5)
/*--------------------------------------------------*/
