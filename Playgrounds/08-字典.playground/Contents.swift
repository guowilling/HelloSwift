//: Playground - noun: a place where people can play

import UIKit

/// 字典: 键值对(key: value)

var stringDict1: [String: String] = ["char1": "A", "char2": "B"] // 键和值都是 String 类型

var stringDict2 = ["char1": "A", "char2": "B"] // 自动推断类型

stringDict1.count

stringDict1.isEmpty

stringDict1["char3"] = "C" // 如果 key 不存在, 则是添加一个键值对

stringDict1["char1"] = "a" // 如果 key 存在, 则是修改一个键值对

stringDict1.updateValue("b", forKey: "char2") // 更新一个键值对, 如果 key 不存在, 则是添加

print(stringDict1)

stringDict1["char2"] // 通过字典的 key 访问 value

stringDict1["char3"] = nil // 移除 key 对应的键值对
stringDict1.removeValue(forKey: "char2")

print(stringDict1)

for (key, value) in stringDict2 { // 遍历字典
    print("\(key): \(value)")
}

for key in stringDict2.keys { // 遍历字典中所有的 key
    print(key)
}

for value in stringDict2.values { // 遍历字典中所有的 value
    print(value)
}

let arrKeys = [String](stringDict2.keys) // 获取字典中所有的 key
print(arrKeys)

let arrValues = [String](stringDict2.values) // 获取字典中所有的 value
print(arrValues)
