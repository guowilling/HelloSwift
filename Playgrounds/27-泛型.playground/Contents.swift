//: Playground - noun: a place where people can play

import UIKit

/// 泛型: 使用泛型能更清晰简洁的表达代码意图

// 交换两个 Int 类型的值
func swapTwoInts(a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}
var someInt = 3
var anotherInt = 5
swapTwoInts(a: &someInt, &anotherInt)
// 但是如果想交换 String 类型, Double 类型呢? 再写两个函数?
// 泛型所解决的问题

// 泛型函数: 在函数名后面添加 <T>, 表示 T 是函数定义的占位类型, 只要前后一致别的字母也可以
func swapTwoValues<T>(a: inout T, _ b: inout T) { // 用 T 来替代实际类型, a 和 b 是同一类型 T
    let temp = a
    a = b
    b = temp
}
swapTwoValues(a: &someInt, &anotherInt) // 调用函数时编译器会根据实际类型推断出 T 的类型

var StringA = "A"
var StringB = "B"
swapTwoValues(a: &StringA, &StringB)    // 只要传入任何相同的类型都可以
print("StringA: \(StringA), StringB: \(StringB)")

// 类型参数:
// 1.在上面的例子中占位类型 T 就是一个类型参数
// 2.类型参数可以在函数名后面加一个占位类型, 并用尖括号括起来, 例如 <T>
// 3.类型参数设定后, 就可以当做函数的参数类型使用了, 可以是参数类型也可以是返回类型
// 4.当函数被调用的时候, 类型参数会被转化为实际类型
// 5.类型参数可以有多个, 可以写在尖括号中, 用逗号隔开
// 6.通常使用单个字母 T U V 来命名类型参数, 但也可以是以大写字母开头的字符串


/// 泛型类型: 能够让自定义类, 结构体, 枚举适用于任何类型, 类似于 Array 和 Dictionary

// 模拟栈的操作过程的泛型集合类型
struct Stack<Element> {
    var items = [Element]() // 使用 Element 为空数组进行初始化
    mutating func push(item: Element) { // push 的参数类型是 Element
        items.append(item)
    }
    mutating func pop() -> Element { // pop 的返回值类型是 Element
        return items.removeLast()
    }
}
var stackOfStrings = Stack<String>() // 尖括号中写出栈中需要存储的数据类型
stackOfStrings.push(item: "A")
stackOfStrings.push(item: "B")
stackOfStrings.push(item: "C")
let fromTheTop = stackOfStrings.pop()
print(stackOfStrings.items)

// 泛型类型的扩展: 原类型中的类型参数在扩展中可以直接使用
extension Stack {
    var topItem: Element? { // 只读计算型属性: 返回栈顶元素
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("topItem: \(topItem)")
}

// 类型约束: swapTwoValues(_:_:) 和 Stack 适用于任何类型, 但有时我们需要对类型进行一些约束, 约束可以是类型参数必须继承特定类, 或者符合特定的协议或组合协议

class SomeClass {}

protocol SomeProtocol {}

// T 的类型参数必须是 SomeClass 的子类, U 的类型参数必须遵守 SomeProtocol 协议
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) { }

// 查询某个元素在数组中的索引位置
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind { // 遵守 Equatable 协议的类型必须实现等式符号和不等式符号, 才能对两个类型进行比较
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 5.0, in: [3.2, 1.0, 5.0, 5,6]) // 2
let stringIndex = findIndex(of: "O", in: ["V", "D", "E", "O"]) // 3

// 关联类型: 为协议中某个类型提供别名
protocol Container { // 定义 Container 协议
    associatedtype ItemType // 通过 associatedtype 关键词来定义关联类型
    mutating func append(item: ItemType) // 添加新的元素到容器里
    var count: Int { get } // 获取容器中的元素个数
    subscript(i: Int) -> ItemType { get } // 通过索引得到容器中的元素
}

struct NewStack<Element>: Container {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    mutating func append(item: Element) {
        self.push(item: item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element { // 编译器会自动推断 Element 就是 ItemType 类型
        return items[i] // 不需要再去指定 ItemType 类型为 Element 类型
    }
}

// where: 约束泛型的类型参数
// where 语句指定 C1 和 C2 的类型必须一致, 且 C1 遵循 Equatable 协议
func allItemMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
    
    if someContainer.count != anotherContainer.count { // 两个容器是否含有相同数量的元素
        return false
    }
    for i in 0..<someContainer.count { // 两个容器的每个元素是否相等
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    return true
}

var stackOfString = NewStack<String>()
stackOfString.push(item: "A")
stackOfString.push(item: "B")
stackOfString.push(item: "C")

var arrayOfString = NewStack<String>()
arrayOfString.items = ["A", "B", "C"]

if allItemMatch(stackOfString, arrayOfString) {
    print("两个容器的元素全部匹配")
} else {
    print("元素不全部匹配")
}
