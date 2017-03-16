//: Playground - noun: a place where people can play

import UIKit

// 扩展: 可以为已有的类, 结构体, 枚举或者协议添加新功能, 类似 ObjC 的分类

// swift中扩展的功能: 
// 1.为已有类扩展计算型实例属性和计算型类型属性
// 2.为已有类添加新的便利构造器
// 3.为已有类添加新的实例方法和类型方法
// 4.为已有类型添加新下标
// 5.为已有的类, 结构体, 枚举添加新的嵌套类型

// 扩展语法
class SomeClass {
    
}

//extension SomeClass: someProtocol {  // 类名前面添加 extension 关键字, ':' 后面写协议名
    // 协议实现写在这里
//}


// 添加计算型实例属性和计算型类型属性
extension Double {                      // 为 Double 添加计算型实例属性
    var m: Double {                     // 只读计算型属性可以省略 get
        return self
    }
    var cm: Double {
        return self / 100.0
    }
    var mm: Double {
        return self / 1000.0
    }
    
    //var invalid: Double?              // ❌ 扩展不能添加存储属性和属性观察器
}

let oneMeter = 100.cm
let centimetreMetre = 10.mm
print("100cm = \(oneMeter)m, 10mm = \(centimetreMetre)m")


// 扩展可以为已有类型添加新的便利构造器
// 但不能添加新的指定构造器和析构器
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let rect1 = Rect()
let rect2 = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 3.0, height: 3.0)) // 通过逐一构造器和默认构造器为实例赋值

// 使用构造器为值类型添加构造器时, 如果该值类型原始实现中未定义任何定制的构造器且所有存储属性提供了默认值
// 这时就可以在扩展中的构造器里调用默认构造器和逐一构造器
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
print(centerRect.origin)


// 通过扩展可以为已有类型添加新的实例方法和类型方法
extension Int {                             // 为 Int 类型添加一个实例方法
    func repetitions(task: () -> Void) {    // 根据 Int 值来决定循环的次数
        for _ in 0..<self {
            task()
        }
    }
}
5.repetitions {
    print("Time")
}

extension Int { // 通过扩展实例方法修改实例本身
    mutating func square() { // 结构体和枚举是值类型, 所以在改变实例本身的时候需要在方法前面加 mutating 关键字
        self = self * self
    }
}
var someInt = 3
someInt.square()
print(someInt)


extension Int { // 通过扩展为已有类型添加新下标
    subscript(digitIndex: Int) -> Int { // 返回从右往左第 N 位的数字(从 0 索引开始)
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
print(21372173[2])
print(245963293023[7])


extension Int { // 通过扩展为已有的类, 结构体, 枚举添加新的嵌套类型
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}

func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("-", terminator: " ")    // terminator: " " 表示不换行并添加一个空格
        case .Zero:
            print("0", terminator: " ")
        case .Positive:
            print("+", terminator: " ")
        }
    }
    print("") // 换行
}

printIntegerKinds(numbers: [12, -4, 0, 32, -74, 2, 0, 12])
