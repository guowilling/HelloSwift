//: Playground - noun: a place where people can play

import UIKit

/// 枚举: 相关的一组值定义成共同的类型

enum enumName {                        // Swift 枚举的语法格式, 可以不指定成员类型
    case caseName                      // 使用 case 定义枚举成员值
}

enum compassPoint {                    // 枚举定义指南针的四个方向
    case North                         // 枚举成员不会像 ObjC 进行隐式赋值
    case South
    case East
    case West
}

enum compassPoint2 {
    case North, South, East, West      // 枚举成员也可以这样定义
}

var direction = compassPoint.North     // direction 为 compassPoint 类型
direction = .West                      // 类型确定之后可以有简略的写法


/// 使用 switch 语句匹配枚举值
direction = .East
switch direction {                     // 省略 defoult 必须穷举所有情况
case .North:
    print("NORTH")
case .South:
    print("SOUTH")
default:
    print("EAST AND WEST")             // EAST AND WEST
}

/// 关联值: 枚举可以存储和修改不同类型的关联值
enum Person {
    case Location(Double, Double)
    case Name(String)
}
var p1 = Person.Location(87.21, 90.123)
p1 = .Name("Alex")
p1 = .Name("Joan")

// Tips: 同一时间只能存储一个值


switch p1 {
case .Location(let x, let y):
    print("X:\(x),Y:\(y)")
case .Name(let name):
    print(name)
}

/// 原始值: 可以给枚举成员设置默认填充值, 但类型必须一致
enum ASCIIChar: Character { // 枚举成员类型: Character
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
print(ASCIIChar.LineFeed.rawValue)

// 原始值的隐藏赋值, 当使用整数作为原始值时, 隐式赋值依次递增 1
enum Mouth: Int { // 枚举成员类型: Int
    case January = 1, February, March, April, May
}
print(Mouth.January.rawValue) // 如果不设置默认值, 则为 0

// Tips: 如果想要像 ObjC 的枚举设置隐式赋值, 可以设置枚举成员类型为 Int

enum Direct: String { // 枚举成员类型: String
    case North
    case South
    case East
    case West
}
print(Direct.North.rawValue)

/// 使用原始值初始化枚举实例, 获得的是一个可选类型
let secondMonth = Mouth(rawValue: 2)
print(secondMonth)


/// 递归枚举创建表达式: (5 + 4) * 2
enum Arth {
    case Number(Int)
    indirect case Add(Arth, Arth)      // indirect 表示枚举成员可递归
    indirect case Mul(Arth, Arth)
}
let five = Arth.Number(5)
let four = Arth.Number(4)
let sum = Arth.Add(five, four)
let result = Arth.Mul(sum, Arth.Number(2))

func evaluate(express: Arth) -> Int {
    switch express {
    case .Number(let value):
        return value
    case .Add(let left, let right):
        return evaluate(express: left) + evaluate(express: right)
    case .Mul(let left, let right):
        return evaluate(express: left) * evaluate(express: right)
    }
}
print(result)
print(evaluate(express: result))
