//: Playground - noun: a place where people can play

import UIKit

/// 字符串: 有序字符的集合

let char: Character = "A" // 字符类型

let aString = "literal" // 通过 "" 便捷创建字符串

var emptyString1 = "" // 空字符串
let emptyString2 = String() // 通过 String() 初始化方法创建空字符串

emptyString2.isEmpty // 通过 isEmpty 方法判断是否为空

emptyString1 = "A B C" // 变量字符串可变
//emptyString2 = "Change Constant String" // 常量字符串不可变

for char in emptyString1.characters { // 遍历字符串
    print(char)
}

emptyString1.characters.count // 字符串中字符的个数, 包括空格

/// 字符串的拼接

var string1 = "Hello"
var string2 = "World"
var string3 = string1 + string2 + "!" // 通过 '+' 拼接两个字符串
print(string3)

string1 += string2 // 等价于 string1 = string1 + string2
string1.append("!")
print(string1)

let messages = "Hello\(string2)!" // 通过把常量或变量放入 '\()' 中, 完成常量或变量的替换和插入
print(messages)

/// 字符串的索引

messages.characters.count

let firstIndex = messages.startIndex
let firstChar = messages[firstIndex]
let secondIndex = messages.index(after: messages.startIndex)
let secondChar = messages[secondIndex]

let endIndex = messages.endIndex
//messages[messages.endIndex] // ❌ 崩溃: Can't form a Character from an empty String
let lastIndex = messages.index(before: endIndex)
let lastChar = messages[lastIndex]

let offsetIndex = messages.index(firstIndex, offsetBy: 5)
let offsetChar = messages[offsetIndex]
//print(messages[offsetIndex])

/// 字符串的插入

var welcome = "Hello"

welcome.insert("!", at: welcome.endIndex) // '!'插入 welcome 的末尾

welcome.insert(contentsOf: "World".characters, at: welcome.index(before: welcome.endIndex)) // 插入的内容是: "World".characters

/// 字符串的删除

let removedChar = welcome.remove(at: welcome.index(before: welcome.endIndex)) // 删除 '!'
//print(removedChar)

let range = welcome.index(welcome.endIndex, offsetBy: -5)..<welcome.endIndex // 删除 'World'
welcome.removeSubrange(range)
//print(welcome)

/// 字符串的比较

welcome == "Hello" // Swift 中可以直接用 '==' '!=' 进行比较
welcome != "Hello"

welcome.hasPrefix("Hel") // 是否有特定的前缀
welcome.hasSuffix("llo") // 是否有特定的后缀

// Tips: Array, Dictionary, Set 集合中都有以下操作: insert(_:at:), insert(contentsOf:at:), remove(at:) removeSubrange(_:)
