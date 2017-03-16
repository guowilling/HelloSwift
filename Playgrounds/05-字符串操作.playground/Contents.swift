//: Playground - noun: a place where people can play

import UIKit

/// 字符串: 有序的字符类型的集合

let char: Character = "A" // 字符类型


let someString = "literal"                   // 通过 "" 包裹字符串为常量或变量提供初始值

var emptyString1 = ""                        // 空字符串, ""内为空
let emptyString2 = String()                  // 空字符串, 通过String()初始化方法为空

emptyString2.isEmpty                         // true, 通过 isEmpty 方法判断是否为空

emptyString1 = "Not Empty"                   // 变量字符串可变
//emptyString2 = "Change Constant String"    // 常量字符串不可变

for char in emptyString1.characters {        // 遍历字符串
    //print(char)
}

emptyString1.characters.count                // 字符串中字符的个数包括空格


/// 字符串和字符的拼接
var string1 = "Hello"
var string2 = "World"
var string3 = string1 + string2              // 通过 '+' 拼接两个字符串
//print(string3)

string1 += string2                           // 等价于 string1 = string1 + string2
string1.append("!")
//print(string1)


/// 字符串的插值
let messages = "Hello\(string2)!"            // 通过将常量或变量放入\()中, 完成常量或变量的替换和插入
print(messages)


/// 字符串的索引
messages.characters.count
let messChar = messages[messages.startIndex]
let firstIndex = messages.index(after: messages.startIndex)
let lastIndex = messages.index(before: messages.endIndex)
let index = messages.index(messages.startIndex, offsetBy: 4)
print(messages[index])
//messages[messages.endIndex]                // ❌ Can't form a Character from an empty String


/// 字符串的插入和删除
var welcome = "Hello"
welcome.insert("!", at: welcome.endIndex)    // '!'插入 welcome 的末尾
welcome.insert(contentsOf: "world".characters, at: welcome.index(before: welcome.endIndex)) // 插入的内容是:"world".characters

let removeChar = welcome.remove(at: welcome.index(before: welcome.endIndex))
print(removeChar)
let range = welcome.index(welcome.endIndex, offsetBy: -5)..<welcome.endIndex
welcome.removeSubrange(range)
print(welcome)

// Array Dictionary Set 集合中都有以下操作:
// insert(_:at:)  
// insert(contentsOf:at:)  
// remove(at:) 
// removeSubrange(_:)


/// 字符串的比较
welcome == "Hello"                          // 字符串可以用 '==' '!=' 直接进行比较
welcome != "Hello"

welcome.hasPrefix("Hel")                    // true 是否有特定的前缀
welcome.hasSuffix("llo")                    // true 是否有特定的后缀

