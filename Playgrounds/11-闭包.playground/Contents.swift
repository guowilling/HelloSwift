//: Playground - noun: a place where people can play

import UIKit

/// 闭包: 用来捕获存储传递代码块以及常量和变量的引用

// sorted 方法
let nums = [4, 6, 2, 9, 5]
let sortNums = nums.sorted()

func backward(_ s1: Int, _ s2: Int) -> Bool {  // 定义函数指定 sorted 规则, 参数类型和 nums 元素一致, 返回布尔值
    return s1 > s2
}
let sortNums1 = nums.sorted(by: backward)

// 但是这样做太麻烦了, 闭包可以很方便的实现

// 闭包语法: 
// { (参数名1: 参数类型, 参数名2: 参数类型) -> 返回类型 in
// 代码块
// return 返回值
// }

let sortNums2 = nums.sorted(by: { (n1: Int, n2: Int) -> Bool in
    return n1 > n2
})
print(sortNums2)

let sortNums3 = nums.sorted(by: { n1, n2 in return n1 < n2 }) // 自动根据上下文推断返回值类型
print(sortNums3)

let sortNums4 = nums.sorted(by: { n1, n2 in n1 < n2 }) // 隐式返回, 返回单行表达式
print(sortNums4)

let sortNums5 = nums.sorted(by: {$0 > $1}) // 内联闭包可以进行参数名缩写, in 也可以省略, $0 $1 为两个 Int 类型的参数
print(sortNums5)

let sortNums6 = nums.sorted(by: >) // 返回类型正好匹配
print(sortNums6)
// 开发中为了代码的可读性, 不提倡刻意简化代码, 应该保证代码的易读性

// 尾随闭包: 调用函数时传递的闭包参数, 写在函数括号之后
func funcTakeClosure(closure: () -> Void) {
    // ...
}

funcTakeClosure(closure: { // 不使用尾随闭包调用函数
    // ...
})

funcTakeClosure() { // 使用尾随闭包调用函数可以省略参数标签
    // ...
}

let sortNums7 = nums.sorted() { $0 > $1 } // 使用尾随闭包调用函数
print(sortNums7)

let sortNums8 = nums.sorted { $0 > $1 } // 函数只有一个参数且是闭包表达式可以省略 '()'
print(sortNums8)

let digitName = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
let numbers = [16, 4, 510]

let strings = numbers.map { (number) -> String in // 通过尾随闭包封装闭包的具体功能
    var number = number
    var output = ""
    repeat {
        output = digitName[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
print(strings)

// 闭包值捕获: 捕获变量或常量
func makeAdd(forAdd amount: Int) -> () -> Int {
    var total = 0
    func add() -> Int {
        total += amount // 函数体内捕获了 total 和 amount 两个变量的引用
        return total // 捕获保证了两个变量在 makeAdd 调用完并不会释放, 并且保证在下次调用 makeAdd 的时候 total 依然存在
    }
    return add
}

let addTen = makeAdd(forAdd: 10) // 定义常量相当于持续持有了 add() 函数
addTen() // 10
addTen() // 20

let addSeven = makeAdd(forAdd: 7) // 新的常量新的内存
addSeven() // 7

addTen() // 30, addTen 和 addSeven 相互独立互不影响

// 闭包是引用类型
addTen() // 40, addTen 其实是引用类型, 指向了为 add() 开辟的内存空间

let also = addTen()
also // 50, 闭包赋值给不同的常量或变量, 都是指向同一个闭包

// 逃逸闭包: 当一个闭包作为参数传到一个函数中, 这个闭包要在函数返回的时候才会被执行
var handlers: [() -> Void] = []

func funcWithEscaping(handler: @escaping () -> Void) { // 外部定义的闭包需要添加标记 @escaping
    handlers.append(handler)
}

func funcWithNoneEscaping(closure: () -> Void) {
    closure()
}

class tempClass {
    var x = 10
    func doSomething() {
        funcWithNoneEscaping { x = 200 }
        funcWithEscaping { self.x = 100 } // 加了 @escaping 标记, 需要显式引用 self
    }
}
let instance = tempClass()
instance.doSomething()
print(instance.x) // 200

handlers.first?()
print(instance.x) // 100

// 自动闭包: 一种自动创建的闭包, 用来当作函数的参数, 这种闭包不接受任何参数, 被调用的时候会返回被包装在其中的表达式的值
// 自动闭包只有在调用的时候, 闭包中的代码才会被执行
var names = ["Chars", "Alex", "Olliver", "Barry"]
names.count // 4
let customerP = { names.remove(at: 0) } // 定义一个自动闭包, 移除第一个元素
names.count // 4, 闭包没调用, 元素个数没变
let ele0 = customerP() // 执行闭包, 返回 "Chars"
names.count // 3

func serve(customerP: () -> String) { // 闭包参数
    customerP() // 执行闭包
}
serve(customerP: { names.remove(at: 0) })
names.count // 2

func serve(customerP: @autoclosure () -> String) { // 添加 @autoclosure 能自动转化为闭包
    customerP()
}

serve(customerP: names.remove(at: 0) ) // 可以把 String 类型的参数传进去
names.count // 1
