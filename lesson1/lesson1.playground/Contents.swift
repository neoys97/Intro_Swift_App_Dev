print ("Hello World")

/*--------------------------------------------------*/
var message = "Welcome to Swift Playground"

var name: String = "Dalton"
var age: Int = 21
var height: Double = 170.0
var employed: Bool = true

name = "Dalton"
age = 20
height = 170.0
employed = true

print ("Hello I am \(name) and I am \(age)")

let pi = 3.14159

/*--------------------------------------------------*/
var firstNumber = 25
var secondNumber = 6

// Arithmetic operators
firstNumber + secondNumber // addition
firstNumber - secondNumber // subtraction
firstNumber * secondNumber // multiplication
firstNumber / secondNumber // division
firstNumber % secondNumber // modulo

// Logical operators
firstNumber > secondNumber  // larger than
firstNumber >= secondNumber // larger than or equal
firstNumber < secondNumber  // smaller than
firstNumber <= secondNumber // smaller than or equal
firstNumber == secondNumber // equal
firstNumber != secondNumber // not equal

firstNumber > 10 && secondNumber > 10 // AND
firstNumber > 10 || secondNumber > 10 // OR

/*--------------------------------------------------*/
for i in 0...5 {
    print ("Loop number \(i)")
}

for i in 0..<5 {
    print ("Loop number \(i)")
}

var i = 0
while i < 5 {
    print ("Loop number \(i)")
    i += 1
}

for i in 0..<100 {
    print ("Loop number \(i)")
    if i > 20 {
        break
    }
}

for i in 0..<10 {
    print ("Loop number \(i)")
    if i == 5 {
        continue
    }
}

/*--------------------------------------------------*/
var number = 5
if number > 10 {
    print ("\(number) is larger than 10")
}
else if number < 10 {
    print ("\(number) is smaller than 10")
}
else {
    print ("\(number) is equal to 10")
}

var color = "Red"
switch color {
    case "Blue":
        print ("Painting with \(color) color")
    case "Yellow":
        print ("Painting with \(color) color")
    case "Red":
        print ("Painting with \(color) color")
    default:
        print ("Unidentified color")
}

/*--------------------------------------------------*/
var sum1to100 = 0
for i in 1...100 {
    sum1to100 += i
}
print ("Sum from 1 to 100 is \(sum1to100)")

/*--------------------------------------------------*/
var sum1to100mul3_5 = 0
for i in 1...100 {
    if i % 3 == 0 || i % 5 == 0 {
        sum1to100mul3_5 += i
    }
}
print ("Sum of numbers from 1 to 100 that are multiples of 3 or 5 is \(sum1to100mul3_5)")

/*--------------------------------------------------*/
var factorialOf10 = 1
for i in 1...10 {
    factorialOf10 *= i
}
print ("Factorial of 10 is \(factorialOf10)")

/*--------------------------------------------------*/
for i in 10...100 {
    var isPrime = true
    for j in 2..<i {
        if i % j == 0 {
            isPrime = false
            break
        }
    }
    if isPrime {
        print (i)
    }
}

/*--------------------------------------------------*/
