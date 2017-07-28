//: Playground - noun: a place where people can play

import UIKit

let constantString: String = "Hello" // 格式: 'let 常量名称: 字符串类型 = "字符串"'
var variableString: String = "World" // 格式: 'var 变量名称: 字符串类型 = "字符串"'

let constantInt: Int = 5 // 常用的类型有: Int Double String Bool
var pi = 3.14 // 系统自动推断 pi 为 Double 类型

//constantInt = 2 // ❌ 编译报错: constantInt 是常量, 不能再次赋值
pi = 3.1415926 // ✅ pi 是变量, 可以再次赋值

print(constantInt)
print("π的值是: \(pi)") // 输出字符串时将常量或变量放入 '\()' 中

let three = 3 // 按住 option, 鼠标移动到变量名上, 点击左键可以查看常量的类型

var pointOneFour = 0.14 // 系统自动推断 pointOneFour 的类型为 Double

pi = Double(three) + pointOneFour // 只有类型一致才能操作, 转换格式: 类型名(变量或常量)

let piInt = Int(pi) // Double 转 Int, 系统自动忽略小数点后面的数, 会损失精度

let trueValue = true // Bool 两种类型: true false
let falseValue = false // 在循环或选择语句的条件判断中只能使用 Bool 值

let i = 10

//if i { // ❌ 编译报错: i 不是 bool 类型
//    print(i)
//}

if i == 10 { // ✅ i == 10 返回一个 Bool 类型
    print(i)
}

let http404Error = (404, "Not Found") // 类型为: (Int, String), 元组中的元素类型可以不同

let (code, message) = http404Error // 元组赋值给一个常量

print("code: \(code), message: \(message).") // code: 404, message: Not Found

let (_, ErrorMessage) = http404Error // '_' 可以起到省略的作用, swift 中应用很广泛
print(http404Error.1) // 通过下标访问元素

let ErrorCode = (requestError: 401, 402, 403) // 定义元组的时候可以给单个元素命名
print(ErrorCode.requestError)
