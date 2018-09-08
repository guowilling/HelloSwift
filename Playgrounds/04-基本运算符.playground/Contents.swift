//: Playground - noun: a place where people can play

import UIKit

let b = 10
var a = 5
a = b // "=" 把 b 的值赋值给 a

let (x, y) = (5, 10) // 左右边都是元组, 自动分解多个常量或变量
print(x) // 1, x 是常量
print(y) // 4, y 是常量

/// 算术运算符 '+' '-' '*' '/' '%'

1 + 1
3 - 1
1 * 2
6 / 3
7 % 3
-11 % 3 // 被除数前的符号被保留
11 % -3 // 除数前的符号被忽略

print("Hello" + "World") // 可以用 '+' 进行字符串拼接

a += 2 // '+=' 等价于 a = a + 2, 其它 -=, *=, /= 等同

/// 比较运算符 '==' '!=' '>' '<' '>=' '<='

3 == 4
3 != 4
3 > 4
3 < 4
3 >= 4
3 <= 4

/// 逻辑运算符 '!' '&&' '||'

!true
true && true
true && false
true || false
false || false

/// 其它

let c = a == 2 ? 3 : 4 // 三目运算符 ':' 如果 a == 2 那么 c 为 3 否则为 4

let optionalE: Int? = 4
let d = optionalE ?? b // 空合运算符, 如果 optionalE 为 nil, d 为 b 的值, 如果不为 nil 就是 optionalE 解包后的值

1...5 // 定义一个 1 到 5 的数包含 1 和 5
1..<5 // 定义一个 1 到 5 的数包含 1, 不包含 5
