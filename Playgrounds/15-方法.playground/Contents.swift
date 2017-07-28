//: Playground - noun: a place where people can play

import UIKit

/// 方法: 完成某些特性功能的函数(结构体, 类, 枚举中都能定义方法)

/// 需要通过实例调用的方法, 实例方法
/// 可以直接通过类型名调用的方法, 类型方法


/// 实例方法: 提供访问和修改实例属性的方法

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        self.count = 0 // self 可省略, 表示当前实例
    }
}

let counter = Counter()
counter.increment()
print(counter.count) // 1
counter.incrementBy(amount: 4)
print(counter.count) // 5
counter.reset()
print(counter.count) // 0

// 结构体和枚举是值类型, 值类型的属性不能直接在实例方法中直接修改, 需要使用 mutating 关键字
struct Point {
    var x = 0.0, y = 0.0
    mutating func movedByX(deltaX: Double, y deltaY: Double) { // mutating 关键字修饰的方法可以在方法中改变结构体的属性
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.movedByX(deltaX: 2.0, y: 3.0)     // 修改了这个点, 而不是返回新的点
print("x: \(somePoint.x), y: \(somePoint.y)")

let fixedPoint = Point(x: 2.0, y: 4.0)
//fixedPoint.movedByX(deltaX: 2.0, y: 2.0)  // ❌ 编译报错: 常量结构体类型的属性不能被改变

// self 代表自身, 在可变方法中给 self 赋值
struct NewPoint {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = NewPoint(x: x + deltaX, y: y + deltaY)
    }
}
var someNewPoint = NewPoint(x: 2, y: 3)
someNewPoint.moveByX(deltaX: 4, y: 5)
print(someNewPoint)

enum StateSwitch {
    case Off, Low, High
    mutating func next() { // 枚举也是值类型, 改变其属性也要加 mutating
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}
var ovenLight = StateSwitch.Low // Low
ovenLight.next() // High
ovenLight.next() // Off


/// 类型方法: 直接通过类型名调用的方法(可以是类, 结构体, 枚举)

enum SomeEnum {
    static func printSome() { // 枚举中的类型方法
        print("SomeEnum")
    }
}
SomeEnum.printSome()

struct SomeStruct {
    static func printSome() { // 结构体中的类型方法
        print("SomeStruct")
    }
}
SomeStruct.printSome()

class Level {
    static var commonLevel = 1 // 公共等级
    class func addOneLevel() { // class 关键字修饰的方法是类型方法, 该方法允许子类重写
        commonLevel += 1
    }
    
    static func addLevelBy(level: Int) { // static 关键字修饰的方法是类型方法, 该方法不允许子类重写, 具有 final 特性
        commonLevel += level
    }
    
    var currentLevel = 1 // 实例等级
    func MaxLevel() -> Int { // 实例方法
        if currentLevel >= Level.commonLevel {
            return currentLevel
        } else {
            return Level.commonLevel
        }
    }
}

Level.addOneLevel()
Level.addLevelBy(level: 3)
print(Level.commonLevel) // 5

let player1 = Level()
player1.currentLevel = 2
print(player1.MaxLevel()) // 5

let player2 = Level()
player2.currentLevel = 7
print(player2.MaxLevel()) // 7
