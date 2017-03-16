//: Playground - noun: a place where people can play

import UIKit

/// 数组: 有序的同一类型的多个元素的集合

var arrInts = [Int]()                     // 定义一个元素类型为Int的可变空数组
arrInts.append(2)                         // arrInts 中添加一个为 2 的元素
print(arrInts)

arrInts = []                              // 空数组的简单定义方式
arrInts = [1, 4]                          // 数组的简单构造方法

var threeDouble = [Double](repeating: 0.0, count: 3) // [0, 0.0, 0.0]
var twoDouble = [Double](repeating: 2.0, count: 2)   // [2.0, 2.0]
var fiveDouble = threeDouble + twoDouble             // 通过 "+" 拼接数组

twoDouble += threeDouble                  // 等价于twoDouble = twoDouble + threeDouble
print(twoDouble)

let secondNum = twoDouble[2]              // 通过下标访问元素, 数组中第一个元素的下标是 0
twoDouble[0] = 3.0                        // 将twoDouble的第一个元素改为3.0
twoDouble[1...2] = [3.0, 3.0]             // 将数组中的 [1...2] 区间改为 [3.0, 3.0] 中的元素
print(twoDouble)

twoDouble.insert(5.0, at: 0)              // 将 4.0 插入到数组第一个元素
print(twoDouble)
twoDouble.remove(at: 0)                   // 移除 0 位置的元素, 后面的元素会自动往前一位
print(twoDouble)
twoDouble.removeLast()                    // 移除最后一个元素
print(twoDouble)

for arrItem in twoDouble {                // 遍历数组
    print(arrItem)
}

for (index, value) in twoDouble.enumerated() { // 使用迭代器遍历数组
    print("索引: \(index), 元素: \(value).")
}
