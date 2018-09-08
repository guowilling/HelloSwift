//: Playground - noun: a place where people can play

import UIKit

/// Swift 在运行时能够对错误进行处理

// 处理错误的几种方式:
// 1.将错误传递给调用函数然后使用 do catch 语句处理错误
// 2.将错误作为可选类型
// 3.使用断言

enum CustomErrorType: Error { // 通过枚举定义错误状态
    case errorReason1
    case errorReason2
    case errorReason3
}

// throws 关键字表示此函数可以抛出错误
class ThrowClass {
    var num: Int?
    func throwFunc() throws { // 如果有返回类型, throws 需要写在 '->' 前面
        guard num == 1 else {                  // 1. num != 1 抛出异常
            throw CustomErrorType.errorReason1 // 2. 异常会传递到函数被调用的作用域
        }                                      // 3. throw 语句会立刻退出当前方法相当于 return
        guard num == 2 else {
            throw CustomErrorType.errorReason2
        }
        guard num == 3 else {
            throw CustomErrorType.errorReason3
        }
    }
}

// 通过 do-catch 处理 throwing 函数抛出的错误
let throwClass = ThrowClass()
throwClass.num = 4
do {
    try throwClass.throwFunc()
} catch CustomErrorType.errorReason1 {
    print("errorReason1")
} catch CustomErrorType.errorReason2 {
    print("errorReason2")
} catch CustomErrorType.errorReason3 {
    print("errorReason3")
} catch {
    print("errorReason") // catch 没有指定类型可以匹配任何错误
}

func someThrowingFunc(num: Int) throws -> Int {
    defer {
        print("defer 语句会在 return, break, 以及错误抛出之前执行")
    }
    defer {
        print("defer 语句可以有多个, 注意多个之间的执行顺序")
    }
    guard num == 3 else { // num != 3 抛出异常, 否则返回 num
        throw CustomErrorType.errorReason1
    }
    return num
}

// 错误转换成可选值
let x = try? someThrowingFunc(num: 3) // 如果 throwing 函数抛出异常那么 x 为 nil
print(x)

let y: Int? // 函数的返回值是 Int
do {
    y = try someThrowingFunc(num: 2)
} catch CustomErrorType.errorReason1 {
    print("errorReason1")
}

if let dataValue = try? someThrowingFunc(num: 2) {  // 可以用 try? 写的更加简洁
    print(dataValue)
} else {
    print("dataValue is nil")
}

// 禁用错误传递: 如果觉得肯定不会有错误抛出可以禁用错误传递
let forbiddenX = try! someThrowingFunc(num: 3) // try? 变为 try!

// defer 语句: 异常抛出前通常需要做一些操作, 比如关闭文件, 手动释放内存等, 这些就可以在 defer 语句中执行
// defer 语句会在 return, break, 以及错误抛出之前执行
// defer 语句可以有多个
// defer 语句必须要写在 throw 语句前面才能执行

// 使用断言: 如果当前值缺失或者不满足特定条件, 可以使用断言使程序崩溃并在控制台输出原因
var age = 3
// 格式: assert(布尔表达式, "控制台输出内容")
assert(age > 0, "年龄不符合逻辑") // 布尔表达式为 true 程序继续执行
age = -5
//assert(age > 0, "年龄不符合逻辑") // 布尔表达式为 false 时会使程序崩溃并在控制台输出内容
