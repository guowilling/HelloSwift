//: Playground - noun: a place where people can play

import UIKit

/// 字典: 每个元素都是一个键值对(key: value)

var chars: [String: String] = ["char1":"A", "char2":"B"] // 键和值都是 String 类型
var charDict = ["char1":"A", "char2":"B"]  // 系统会作自动推断类型

chars.count
chars.isEmpty
chars["char3"] = "C"                       // 添加一个键值对
chars["char1"] = "a"                       // 修改 key 对应的 value

chars.updateValue("b", forKey: "char2")    // 更新键值对, 如果这个键不存在则是添加

print(chars)

chars["char2"]                             // 通过字典的 key 访问 value
chars["char3"] = nil                       // 移除键值对
chars.removeValue(forKey: "char2")         // 移除键值对
print(chars)


for (key, value) in charDict {             // 遍历字典
    print("\(key): \(value)")
}
for key in charDict.keys {                 // 遍历字典中所有的 key
    print(key)
}

for value in charDict.values {             // 遍历字典中所有的 value
    print(value)
}

let arrKeys = [String](charDict.keys)      // 获取字典中所有的 key
print(arrKeys)
let arrValues = [String](charDict.values)  // 获取字典中所有的 value
print(arrValues)
