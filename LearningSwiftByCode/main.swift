//
//  main.swift
//  LearningSwiftByCode
//
//  Created by DaFenQI on 2017/9/14.
//  Copyright © 2017年 DaFenQi. All rights reserved.
//

import Foundation

var str = "Hello, playground"
print(str)

var floatValue: Float = 4
print(floatValue)

let label = "The width is"
let width = 94.0
let widthLabel = label + String(width)
let widthLabel1 = label + "\(width)"
print(widthLabel1)

let apples = 3
let oranges = 5
let appleSummary = "i have \(apples) apples"
let orangesSummary = "i have \(oranges) oranges"
print(appleSummary)
print(orangesSummary)

let helloFloat = "hello \(floatValue)"
print(helloFloat)

var shoppingLists = ["catFish", "water", "tulips", "blue paint",]
shoppingLists[1] = "bottle of water"
print(shoppingLists)

var occupations = [
    "Malcolm" : "Captain",
    "Kaylee" : "Mechae",
]
occupations["Jayne"] = "Public Relation"
print(occupations);

var emptyArray = [String]()
var emptyDictionary = [String : Float]()

//emptyArray = []
//emptyDictionary = [:]

let individualScores = [75, 43, 103, 87, 12]
var tempScore = 0
for score in individualScores {
    if score > 50 {
        tempScore += 3
    } else {
        tempScore += 1
    }
}
print(tempScore)

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

// if 和 let 是 Swift 的语法糖
// 因为 Swift 的可选值，有可能值缺失，
// 若没有 if let
// 我们的代码将会像下面一样：
var optionalName1: String?
var greeting1 = "Hello"
let name: String! = optionalName1
if name != nil {
    greeting1 = "Hello, \(name)"
} else {
    greeting1 = "Hello No Name"
}

// without let
func doSomethingWithoutLet(str: String?) {
    let v: String! = str;
    if (v != nil) {
        // do something
        print(v)
    }
}

doSomethingWithoutLet(str: "without let")
doSomethingWithoutLet(str: nil)

// with let
func doSomethingWithLet(str: String?) {
    if let v = str {
        // do something
        print(v)
    }
}

doSomethingWithLet(str: "with let")
doSomethingWithLet(str: nil)

// without guard
func doSomethingWithoutGuard(str: String?) {
    let v: String! = str
    if str == nil {
        return
    }
    print(v)
}

doSomethingWithoutGuard(str: "without guard")
doSomethingWithoutGuard(str: nil)

// with guard
func doSomethingWithGuard(str: String?) {
    guard let v = str else {
        return
    }
    print(v)
}

doSomethingWithGuard(str: "with guard")
doSomethingWithoutGuard(str: nil)

// ? 对于值缺失的情况我们也可以使用 ?? 指定默认值
let nickName: String? = nil
let defaultName: String = "John Appleseed"
let informGreeting = "Hi \(nickName ?? defaultName)"

// Swift 支持任意类型的数据以及各种比较操作 -- 不仅仅是整数操作
// Swift 的 switch 语句不需要 break，命中之后直接退出 switch 语句
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log")
case "cucumber", "watercress":
    print("That would make a good tea sandwich")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)")
default:
    print("Everything tastes good in soup.")
}

let interestingNumbers = [
    "Prime" : [2, 3, 5, 7, 11, 13],
    "Fibonacci" : [1, 1, 2, 3, 5, 8],
    "Square" : [1, 4, 9, 16, 25],
]
var largest = 0
var largestKind: String? = nil
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number;
            largestKind = kind;
        }
    }
}
print(largest)
print(largestKind ?? "no kind")

var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

var total = 0
for i in 0..<4 {
    print(i)
    total += i
}
print(total)

for i in 0...4 {
    print(i)
}

// 函数和闭包
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)"
}

print(greet(person: "Bob", day: "Tuesday"))

func lanch(person: String, food: String) -> String {
    return "Hello \(person) i' ve eat \(food)"
}

print(lanch(person: "Bob", food: "shit"))

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}

print(greet("john", on: "Wednesday"))

// 使用元组可以返回多个值
func caculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    if scores.count < 1 {
        return (0, 0, 0)
    }
    
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        }
        if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = caculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.min)
print(statistics.max)
print(statistics.0)
print(statistics.1)
print(statistics.2)

// 可变参数 在函数内部表现为数组的形式
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

print(sumOf())
print(sumOf(numbers: 42, 597, 12))

// 函数嵌套
func returnFifteem() -> Int {
    var y = 10
    func add () {
        y += 5
    }
    add()
    return y
}
print(returnFifteem())

// 函数式编程
// 函数是第一等类型
// 意味着 函数可以被传递
// 函数作为返回值
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne;
}
var increment = makeIncrementer()
print(increment(7))

// 函数作为参数
func hasAnyMatches(list: [Int], condition: ((Int) -> Bool) ) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10;
}

var numbers = [20, 19, 7, 12]
print(hasAnyMatches(list: numbers, condition: lessThanTen))

/*
 函数实际上是一种特殊的闭包:它是一段能之后被调取的代码。闭包中的代码能访问闭包所建作用域中能得到的变 量和函数，即使闭包是在一个不同的作用域被执行的 - 你已经在嵌套函数例子中所看到。你可以使用 {} 来创建 一个匿名闭包。使用 in 将参数和返回值类型声明与闭包函数体进行分离。
 numbers.map({
 (number: Int) -> Int in
 let result = 3 * number
 return result
 })
 */
let number = numbers.map { (number: Int) -> Int in
    let result = 3 * number
    return result
}
print(number)

let number1 = numbers.map { (number: Int) -> Int in
    if number % 2 == 1 {
        return 0
    }
    return number
}

print(number1)

// Swift3.0 闭包 总结
// 一般形式
/*
 {
    (parameters) -> returnType in 
    statement
 }
 in 关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始。由 in 引入参数
 */

let calAdd: (Int, Int) -> (Int) = {
    (a: Int, b: Int) -> Int in
    return a + b;
}
print(calAdd(1, 4))

// Swift 可以根据上下文推测出闭包的参数类型和返回值类型，所以可以简写
let calAdd1: (Int, Int) -> (Int) = {
    (a, b) in
    return a + b
}
print(calAdd1(1, 4))

// 单行闭包，可以把语句计算结果，作为 return
let calAdd2: (Int, Int) -> (Int) = {
    (a, b) in
    a + b
}
print(calAdd2(1, 4))

// 如果闭包没有参数 可直接省略 in
let calAdd3: () -> (Int) = {
    100 + 200
}
print(calAdd3())

// 既没有参数又没有返回值
let calAdd4: ()->Void = {
    print("you are 250")
}
calAdd4()

typealias AddBlock = (Int, Int) -> Int;
let calAdd5: AddBlock = {
    (c, d) in
    c + d
}
print(calAdd5(1, 4))

// 尾随闭包
func testFuncation(testBlock: () -> Void) {
    testBlock();
}

// 普通写法
testFuncation(testBlock: {
    () -> Void in
    print("尾随闭包")
})
// 省略写法
testFuncation() {
    print("尾随闭包")
}
// 推荐写法
testFuncation {
    print("尾随闭包")
}

func captureValue(sums amount: Int) -> (() -> Int) {
    var total = 0
    func increment() -> Int {
        total += amount
        return total
    }
    print(total)
    return increment;
}

print(captureValue(sums: 10)())
print(captureValue(sums: 10)())
print(captureValue(sums: 10)())

let reference = captureValue(sums: 10)
print(reference())
print(reference())
print(reference())

func captureValue1(sum amount: Int) -> (() -> Int) {
    var total = 0
    // 定义闭包
    let addBlock: (() -> Int) = {
        total += amount
        return total
    }
    print(total)
    return addBlock
}

print(captureValue1(sum: 10)())
print(captureValue1(sum: 10)())
print(captureValue1(sum: 10)())

let reference1 = captureValue1(sum: 10)
print(reference1())
print(reference1())
print(reference1())

// 以上例子说明 闭包和函数都是引用类型

// 逃逸闭包
// 延时操作 
/*
func doSomething(some: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { 
        some()
    }
    print("函数体")
    RunLoop.current.run()
}

doSomething {
    print("逃逸闭包")
    RunLoop.current.run()
}
 */

var completionHandle: () -> String = {
    "约么？"
}

func doSomething2(some: @escaping () -> String) {
    completionHandle = some
}

doSomething2 {
    return "叔叔我们不约"
}

print(completionHandle())

var completionHandles: [() -> Void] = []
// 逃逸
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandles.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        
        someFunctionWithNonescapingClosure {
            x = 100
        }
    }
}

var array = ["I","have","a","apple"]
print(array.count)

let removeBlock = {array.remove(at: 3)}
print(array.count)

print("执行代码块移除\(removeBlock())")
print(array.count)

class Shape {
    var numberOfSides = 0
    var name: String
    let numberOfFucks = 10;
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func sayFuck(to name: String) -> Void {
        print("Fuck you ! \(name)")
    }
    
    init(name: String) {
        print("init:\(name)")
        self.name = name
    }
    
    init() {
        print("init")
        self.name = "default name"
    }
    
    deinit {
        print("deinit")
    }
}

var shape = Shape()
shape.numberOfSides = 7
print(shape.simpleDescription())

class NameShape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

class Square: NameShape {
    var sideLength: Double = 0
    
    init(sideLength: Double, name: String) {
        super.init(name: name)
        self.sideLength = sideLength
    }
    
    override func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides of length \(sideLength)"
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
}

var square: Square = Square(sideLength: 10, name:"Square")
print("area is \(square.area())")
print(square.simpleDescription())

class Circle: NameShape {
    var radius: Double = 0
    init(radius: Double, name: String) {
        super.init(name: name)
        self.radius = radius
    }
    
    func area() -> Double {
        return radius * radius * Double.pi
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)"
    }
}

var circle: Circle = Circle(radius: 10, name: "Cycle")
print(circle.area())
print(circle.simpleDescription())

class EquilateralTriangle: NameShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        super.init(name: name)
        self.sideLength = sideLength
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }
}

var triangle: EquilateralTriangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name);
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "large square")
print(triangleAndSquare.triangle.sideLength)

// 可选值
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
// 如果 optionalSquare 是可选值，则 optionalSquare?.sideLength 若 optionalSquare为 nil 则不执行后面的语句返回 nil
let sideLength = optionalSquare?.sideLength
print(sideLength ?? 0.0)

// 枚举结构体
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue
print(ace.simpleDescription())

if let convertedRank = Rank(rawValue: 3) {
    print(convertedRank.simpleDescription())
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .Spades, .Hearts:
            return "blue"
        default:
            return "yellow"
        }
    }
}

let hearts = Suit.Hearts
print(hearts.simpleDescription())
print(hearts.color())

// 枚举成员值， 实例值，原始值

enum ServerResponse {
    // Result 成员值
    // String String 实例值
    // 原始值 未指定
    case Result(String, String)
    case Failure(String)
}

let success = ServerResponse.Result("6.00 am", "8.09 pm")
let failure = ServerResponse.Failure("out of cheese")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
    print(serverResponse)
case let .Failure(message):
    print("Failure...  \(message)")
}

// struct 结构体
//  结构体和类的区别在于 结构体是值类型，类是引用类型
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
print(threeOfSpades.simpleDescription())

// 练习: 给 Card 添加一个方法，创建一副完整的扑克牌并把每张牌的 rank 和 suit 对应起来。

// 协议和扩展
protocol ExampleProtocol {
    var simpleDescription: String {
        get
    }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
print(a.simpleDescription)

struct SimpleStruct: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStruct()
b.adjust()
print(b.simpleDescription)

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

print(7.simpleDescription)
// 协议和扩展 寻找文章 过一遍

// 错误处理
enum PrinterError: Error {
    case OutOfPaper
    case NOToner
    case OnFire
}

func send(job: Int, toPrinter printName: String) throws -> String {
    if printName == "Never Had Toner" {
        throw PrinterError.NOToner
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printResponse)
} catch PrinterError.OnFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

// 泛型 函数
func repeatItem<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

print(repeatItem(repeating: "knock", numberOfTimes:4))

// 重新实现 Swift 标准库中的可选类型
enum MyOptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}

var myOptionalValue: MyOptionalValue<Int> = .None
myOptionalValue = .Some(100)
print(myOptionalValue)

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            } }
    }
    return false
}

print(anyCommonElements([1, 2, 3], [4]))

//// 练习: 修改 anyCommonElements(_:_:) 函数来创建一个函数，返回一个数组，内容是两个序列的共有元素。
//func anyCommonElements<T: Sequence, U: Sequence>(lhs: T, rhs: U) -> T
//    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
//        var elements: T = []
//        for lhsItem in lhs {
//            for rhsItem in rhs {
//                if lhsItem == rhsItem {
//                    elements.add()
//                }
//            }
//        }
//    
//}
/*
 do {
 let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
 第 1 章 欢迎使用 Swift | 21
 print(printerResponse)
 } catch PrinterError.onFire {
 print("I'll just put this over here, with the rest of the fire.")
 } catch let printerError as PrinterError {
 print("Printer error: \(printerError).")
 } catch {
 print(error)
 }
 
 
 func send(job: Int, toPrinter printerName: String) throws -> String {
 if printerName == "Never Has Toner" {
 throw PrinterError.noToner
 }
 return "Job sent"
 }
 有多种方式可以用来进行错误处理。一种方式是使用 do-catch 。在 do 代码块中，使用 try 来标记可以抛出错误 的代码。在 catch 代码块中，除非你另外命名，否则错误会自动命名为 error 。
 do {
 let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
 print(printerResponse)
 } catch {
 print(error)
 }
 */


// 总结
// Swift 强类型语言，比较安全 可选值
// 函数式编程， 函数和闭包是一等公民，可以作为参数和返回值传递
// 元组 可以用来 返回多个参数
// switch 可以 枚举任意类型的值
// 闭包， 普通闭包，逃逸闭包， 普通闭包不会持有 self，逃逸闭包会
// guard 和 if let 方便的处理可选值
//


