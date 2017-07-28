//: Playground - noun: a place where people can play

import UIKit

/// 函数: 用来完成特定任务的代码片段

// 定义方式:
func greet(person: String) -> String { // func 函数名(参数名: 参数类型) -> 返回值类型
    return "Hello, \(person)!" // return 返回值
}

// 调用方式:
let greetWord = greet(person: "Dariel") // 函数名(参数名: 参数)
print(greetWord)

func say() -> String { // 无参数有返回值
    return "Hello"
}
print(say())

func say(person1: String, person2: String) -> String { // 多个参数有返回值
    return "Hello, \(person1), \(person2)."
}
print(say(person1: "Lily", person2: "Lucy"))

func sayHello() { // 无参数无返回值
    print("Hello")
}
sayHello()

// 寻找数组中的最大值和最小值
func finMinAndMaxInArray(array: [Int]) -> (min: Int, max: Int)? { // 使用元组返回多个值
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax) // 考虑到数组为空的情况, 返回值为可选类型
}

let results = finMinAndMaxInArray(array: [3, 5, 6, 12, 8, 10]) // results 是一个元组类型
print(results!.max) // 通过点语法取值
print(results!.min) // '!' 强制解包

// 函数的参数标签和参数名称
func someFunction(label name: String) -> String { // label 是参数标签, name 是参数名称
    return name // 函数实现中使用参数名称
}
someFunction(label: "Dariel") // 调用函数时使用参数标签
// 目的: 使函数在调用的时候表达力更强, 并且保持函数内部的可读性

// 忽略参数标签: 可以通过下划线 '_' 来忽略参数标签
func ignoreLabel(_ name1: String, label2 name2: String) {
    print(name1 + name2)
}
ignoreLabel("Lily", label2: "Lucy") // 忽略的参数标签调用时不会显示

// 参数默认值
func defaultLabel(label1 name1: String, label2 name2: String = "Lily") {
    print(name1 + name2)
}
defaultLabel(label1: "Lucy", label2: "Lilei")
defaultLabel(label1: "Lucy") // 有默认值的参数调用时可以省略

// 计算多个数的平均数
func avarageNum(_ num: Double...) -> Double { // 参数后面加 '...' 表示有多个参数
    var total: Double = 0
    for number in num {
        total += number
    }
    return total / Double(num.count)
}
avarageNum(2, 6, 4, 8, 7) // 参数个数不限
avarageNum(5)
// 注意: 函数只能有一个可变参数

// 交换两个变量的值
func swapTwoInts(_ a: inout Int, _ b: inout Int) { // inout 可以传指针参数
    let temp = a
    a = b
    b = temp
}
var a = 5
var b = 10
swapTwoInts(&a, &b) // 调用时传递 a , b 两个变量的地址
print("a=\(a), b=\(b)")

// 函数类型: 可以把函数当作常量或变量赋值给常量或者变量
var swap = swapTwoInts // swap 的类型: (inout Int, inout Int) -> ()
swap(&a, &b)
print("a=\(a), b=\(b)") // swap 等价于 swapTwoInts

// 函数作为参数
func sum(num1: Int, num2: Int) -> Int { // 和
    return num1 + num2
}

func sub(num1: Int, num2: Int) -> Int { // 差
    return num1 - num2
}

func mathNumber(_ mathFunc: (Int, Int) -> Int, _ a: Int, _ b: Int) -> Int {
    return (mathFunc(a, b))
}

mathNumber(sum, 4, 2) // 6
mathNumber(sub, 4, 2) // 2

// 函数作为返回类型
func chooseSumOrSun(_ isSum: Bool) -> (Int, Int) -> Int {
    return isSum ? sum : sub
}
chooseSumOrSun(true)(4, 2) // 6

// 函数嵌套
func chooseSumOrSub(isSum: Bool, _ a: Int, _ b: Int) -> Int {
    func sum(num1: Int, num2: Int) -> Int { return num1 + num2 }
    func sub(num1: Int, num2: Int) -> Int { return num1 - num2 }
    return isSum ? sum(num1: a, num2: b) : sub(num1: a, num2: b)
}

chooseSumOrSub(isSum: true, 4, 2) // 6
