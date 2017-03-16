//: Playground - noun: a place where people can play

import UIKit

let b = 10
var a = 5
a = b                                // "=" 的意思把 b 的值赋值给 a

let (x, y) = (5, 10)                  // 左右边都是一个多元组, 自动分解多个常量或变量
print(x)                             // 1, x 为常量
print(y)                             // 4, y 为常量


/// 算术运算符 '+' '-' '*' '/' '%'
1 + 1                                // 2
3 - 1                                // 2
1 * 2                                // 2
6 / 3                                // 2

7 % 3                                // 求余运算
-11 % 3                              // 11前的符号能被保留
11 % -3                              // 3的符号会被忽略

a += 2                               // 等价于 a = a + 2

print("Hello" + "World")             // 可以用 '+' 进行字符串拼接

/// 比较运算符 '==' '!=' '>' '<' '>=' '<='
3 == 4                               // false
3 != 4                               // true
3 > 4                                // false
3 < 4                                // true
3 >= 4                               // false
3 <= 4                               // true

let c = a == 2 ? 7 : 8               // 三目运算符 ':' 如果 a == 2 那么 c 为7否则为8


let optionalE: Int? = 4
let d = optionalE ?? b              // 空合运算符, 如果 optionalE 为 nil, d 为 b 的值, 如果不为 nil 就是 optionalE 解包后的值

1...5                               // 定义一个 1到5 的数包含1和5
1..<5                               // 定义一个 1到5 的数只包含1

// 逻辑非 '!' 
// 逻辑与 '&&'
// 逻辑或 '||'
!true                               // false
true && true                        // true
true && false                       // false
true || false                       // true
false || false                      // false
