import UIKit

//let digitNames = [
//    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
//    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
//]
//let numbers = [16, 58, 510]
//
//let strings = numbers.map { (number) -> String in
//    var number = number
//    var output = ""
//    repeat {
//        output = digitNames[number % 10]! + output
//        number /= 10
//    } while number > 0
//    return output
//}
//
//strings
func fibonacci(n: Int) {
    var res: [Int] = []
    if n >= 1 {
        res.append(0)
    }
    if n >= 2 {
        res.append(1)
    }
    if n > 2 {
        for i in 1...n - 2 {
            res.append(res[i] + res[i - 1])
        }
    }
    print(res)
}

fibonacci(n: 3)
//fibonacci(n: 10)
