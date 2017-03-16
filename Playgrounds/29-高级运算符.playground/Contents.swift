//: Playground - noun: a place where people can play

import UIKit

// 位运算符: 操作数据结构中每个独立的比特位

// '~': 按位取反运算符
let bits: UInt8 = 0b0011          // UInt8 的范围为: 0~255, bits 表示十进制的3
let invertBits = ~bits            // 按位取反运算符, 全部位取反, 得到十进制的252

let firstTwoBits = 0b10                      // 十进制的2
let secondTwoBits = 0b11                     // 十进制的3

// '&': 按位与运算符
let fourBits = firstTwoBits & secondTwoBits     // 按位与结果为 0b10

// '|': 按位或运算符
let combinedBits = firstTwoBits | secondTwoBits // 按位或结果为0b11

// '^': 按位异或运算符
let outputBits = firstTwoBits ^ secondTwoBits   // 按位或结果为0b01

let shiftBits: UInt = 0b00110     // 十进制的6

// '<<': 按位左移
shiftBits << 1                    // 0b01100, 左移动一位, 十进制的12

// '>>': 按位右移
shiftBits >> 1                    // 0b00011, 右移动一位, 十进制的3


// 溢出运算符: 当一个数值超过了它的有效范围, 编译器会报错
var overflowInt: UInt8 = 255      // UInt8 的范围为: 0~255
//overflowInt = 256               // ❌
//overflowInt = -1                // ❌


// 数值的溢出直接报错不太友好, 可以做截断处理, 有以下几种方法可以处理:
// 1.溢出加法 &+ 
// 2.溢出减法 &- 
// 3.溢出乘法 &*
overflowInt = UInt8.max           // 最大值 255
overflowInt = overflowInt &+ 1    // 二进制加1的时候发生溢出变成了 00000000

overflowInt = UInt8.min           // 最小值 0
overflowInt = overflowInt &- 1    // 二进制减1的时候发生溢出变成了 11111111


// 运算符函数: 可以通过运算符操作类和结构体
struct Point {
    var x = 0.0, y = 0.0
}

// 加法运算符
extension Point {
    static func + (left: Point, right: Point) -> Point {        // 该运算符函数需要接受两个 Point 类型的参数, 返回一个 Point 类型值
        return Point(x: left.x + right.x, y: left.y + right.y)
    }
}
let point = Point(x: 2.0, y: 3.0)
let anotherPoint = Point(x: 1.0, y: 2.0)
print(point + anotherPoint)

// 前缀和后缀运算符
extension Point {
    static prefix func - (point: Point) -> Point {              // 实现前缀或者后缀运算符需要在声明运算符函数的时候, 在 func 之前加 prefix 或 postfix 关键字
        return Point(x: -point.x, y: -point.y)
    }
}
let position = Point(x: 3.0, y: 3.0)
print(-position)

// 复合赋值运算符
extension Point {
    static func += (left: inout Point, right: Point) {          // 需要把左边的参数设置为 inout, 因为这个参数会在运算符内被修改
        left = left + right
    }
}
var original = Point(x: 1.0, y: 3.0)
let pointToAdd = Point(x: 2.0, y: 3.0)
original += pointToAdd
print(original)

// 等价运算符
extension Point {
    static func == (left: inout Point, right: Point) -> Bool {  // 通过函数来判断两个 Point 是否相等
        return (left.x == right.x) && (left.y == right.y)
    }
    
    static func != (left: inout Point, right: Point) -> Bool {  // 通过调用相等运算符函数来判断两个 Point 是否不相等
        return !(left == right)
    }
}
var twoThree = Point(x: 2.0, y: 3.0)
let anotherTwoThree = Point(x: 2.0, y: 3.0)
print(twoThree == anotherTwoThree) // true
print(twoThree != anotherTwoThree) // false


// 自定义运算符: 除了使用系统的运算符, Swift 还支持自定义运算符

// 使用 operator 关键字定义新的运算符, 同时还要指定, prefix 或 infix 或 postfi
prefix operator +++               // 自定义运算符 '+++'
extension Point {
    static prefix func +++ (point: inout Point) -> Point {
        point += point            // 调用 += 运算符函数
        return point
    }
}
var toBeDouble = Point(x: 2.0, y: 2.0)
+++toBeDouble
print(toBeDouble)
