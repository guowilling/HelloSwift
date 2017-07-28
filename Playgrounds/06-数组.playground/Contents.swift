//: Playground - noun: a place where people can play

import UIKit

/// 数组: 有序同类型元素的集合

var arrInts = [Int]() // 定义一个元素类型为 Int 的可变空数组
arrInts.append(2) // 向 arrInts 中添加元素 2
print(arrInts)

arrInts = [] // 空数组的便捷定义方式
arrInts = [1, 4] // 数组的便捷构造方法

var threeDouble = [Double](repeating: 0.0, count: 3) // [0.0, 0.0, 0.0]
var twoDouble = [Double](repeating: 2.0, count: 2) // [2.0, 2.0]
var fiveDouble = threeDouble + twoDouble // 通过 "+" 合并数组

twoDouble += threeDouble // 等价于 twoDouble = twoDouble + threeDouble
print(twoDouble)

let secondNum = twoDouble[2] // 通过下标访问元素, 数组中第一个元素的下标是 0
twoDouble[0] = 3.0 // 将数组中的第一个元素改为 3.0
twoDouble[1...2] = [3.0, 3.0] // 将数组中的 [1...2] 区间元素改为 [3.0, 3.0] 中的元素
print(twoDouble)

twoDouble.insert(5.0, at: 0) // 将 5.0 插入到数组中的索引 0 位置的元素, 即第一个元素位置
print(twoDouble)
twoDouble.remove(at: 0) // 移除数组中的索引 0 位置的元素, 后面的元素会自动往前一位
print(twoDouble)
twoDouble.removeLast() // 移除最后一个元素
print(twoDouble)

for arrItem in twoDouble { // 遍历数组
    print(arrItem)
}

for (index, value) in twoDouble.enumerated() { // 使用迭代器遍历数组
    print("索引: \(index), 值: \(value)")
}
