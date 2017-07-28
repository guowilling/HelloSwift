//: Playground - noun: a place where people can play

import UIKit

/// for in

for num in 1...5 { // 依次把闭区间 [1, 5] 中的值赋值给 num
    print(num)
}

for _ in 1...5 { // _ 省略变量名
    print("A")
}

let chars = ["a", "B", "C", "D"]
for char in chars {
    print(char)
}

let charDict = ["0": "A", "1": "B", "2": "C"]
for (key, value) in charDict {
    print("key: \(key), value: \(value)")
}

/// while

var num = 3
while num > 0 {
    print(num)
    num = num - 1
}

/// repeat while

num = -3
repeat { // 第一次即使条件不满足也会进入 { } 中的代码
    print(num)
    num = num - 1
} while num > 0

/// if

num = 5
if num == 3 {
    print(num)
} else {
    print("num is not equeal to 3")
}

if num == 3 {
    // 执行语句
} else if num == 4 {
    // 执行语句
} else {
    print(num)
}

/// switch

num = 12
switch num {
case 2:
    print("num 等于 2") // case 分支至少需要包含一条语句, case 分支末尾不需要写 break
case 3, 4, 5: // case 可以匹配多个值, 值之间用 ',' 隔开
    print("num == 3 or 4 or 5")
case 6..<10: // case 也支持区间
    print("6 <= num < 10")
case 10..<19 where num % 3 == 0: // 使用 where 语句来增加额外判断条件
    print("10 <= num < 19, 且能被3整除")
default:
    print("上面的情况都不满足")
}

/// continue

num = 5
while num > 0 {
    num = num - 1
    if num == 2 {
        continue
    }
    print(num)
}

/// break

num = 5
while num > 0{
    num = num - 1
    if num == 2 {
        break
    }
    print(num)
}

// continue 与 break 的区别: continue 是终止本次循环开始下一次循环, 不会离开整个循环体; break 是终止整个循环, 会离开当前循环体.

/// fallthrough

num = 2
switch num {
case 2:
    print("Hello")
    fallthrough // 使用 fallthrough 可以连续到下一个 case
case 3:
    print("World")
default:
    print("!")
}

/// 循环体标签

var num2 = 4
var num1 = 6
numLoop: while num1 > 0 { // 给循环语句设置标签, 方便终止该循环体
    num2Loop: while num2 > 0 {
        print(num2)
        break numLoop
    }
    print(num1) // 不会打印
}

/// guard

num2 = 2
func guardTest() {
    guard num2 == 5 else { // 如果 guard 条件不满足则执行 else 后面 { } 中的代码
        print(num2)
        return
    }
    print(num2) // Use num2 Here!
}
guardTest()

// 系统版本适配(平台可以是: iOS macOS watchOS tvOS)
if #available(iOS 10, *) {
    // iOS10 及以上的 API
} else {
    // iOS10 以下的 API
}
