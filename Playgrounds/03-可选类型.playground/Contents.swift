//: Playground - noun: a place where people can play

import UIKit

/// 可选类型 '?' / '!'
/// 可选类型的两种状态: 有值 / 没有值
/// 任何的常量或者变量都会有两种状态: 有值 / 值缺失

var errorCode: Int? = 404                // 在类型后面添加一个 '?'
print(errorCode)                         // Optional(404)

errorCode = nil                          // 对非可选类型赋值 nil 会报错
print(errorCode)                         // nil

/// Swift 中 nil 的含义: nil 是一个值, 表示常量或变量的缺失, 所以任何类型都可以设置为 nil
var errorMessage: String?                // 只声明可选类型没赋值会默认设置为 nil

errorCode = 404
// if 语句强制解析
if errorCode != nil {                    // 确定可选类型包含值后可以在变量名后加!强制解析
    print(errorCode!)                    // 404
}
//print(errorMessage!)                   // ❌ unexpectedly found nil while unwrapping an Optional value

/// 可选绑定,将可选类型赋值给一个临时的变量或者常量
if let code = errorCode {
    print(code)                          // 自动解析输出 404
} else {
    //print(code)                        // ❌use of unresolved identifier 'code'
    print(errorCode)                     // 如果 errorCode = nil 此处输出 nil
}

/// 隐式解析可选类型: 因为一定有值所以可以免去解析的麻烦
let assumedString: String! = "ABC"       // 可选类型的 '?' 改成 '!'
print(assumedString)                     // ABC
if let TempString = assumedString {      // 隐式解析可选类型可以当做普通可选类型使用
    print(TempString)                    // ABC
}
