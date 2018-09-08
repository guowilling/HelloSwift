//: Playground - noun: a place where people can play

import UIKit

/// 可选类型 '?' / '!'
/// 可选类型的两种状态: 有值 / 没值
/// 任何常量或变量都会有两种状态: 有值 / 值缺失

var errorCode: Int? = 404 // 类型后面添加一个 '?'
print(errorCode) // 输出 Optional(404)

var errorCodeNotOptional: Int = 405
//errorCodeNotOptional = nil // 非可选类型赋值为 nil 会报错

errorCode = nil
print(errorCode) // nil

/// Swift 中 nil 的含义: nil 是一个值, 表示常量或变量的缺失, 所以任何类型都可以赋值为 nil

var errorMessage: String? // 变量声明为可选类型, 且没有赋初值时默认为 nil

errorCode = 404

// if 语句强制解析
if errorCode != nil { // 确定可选类型有值后, 可以在变量名后加 '!' 强制解析
    print(errorCode!) // 输出 404
}
//print(errorMessage!) // ❌ 崩溃: unexpectedly found nil while unwrapping an Optional value

/// 可选绑定: 可选类型赋值给一个临时的变量或者常量

if let code = errorCode {
    print(code) // 自动解析
} else {
    //print(code) // ❌ 崩溃: use of unresolved identifier 'code'
    //print(errorCode) // 如果 errorCode = nil 此处输出 nil
}

/// 隐式解析可选类型: 因为一定有值所以可以免去解析的麻烦

let assumedString: String! = "ABC" // 可选类型的 '?' 改成 '!'
print(assumedString)
if let TempString = assumedString { // 隐式解析可选类型可以当做普通可选类型使用
    print(TempString) // ABC
}
