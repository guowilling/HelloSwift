//: Playground - noun: a place where people can play

import UIKit

/// Set: 无序同类型元素的集合(Note: 相同的元素只能存储一个)

var chars1 = Set<Character>() // 创建一个存储 Character 类型元素的空 Set

let chars2: Set<Character> = [] // 定义空 Set 的便捷方式

var letter1: Set = ["a", "b", "c", "d", "e"]

var letter2 = ["a", "b", "c"] // 如果省略 Set, 类型默认被推断为数组

letter1.count // 元素个数

letter1.isEmpty // 判断是否为空

letter1.insert("a") // 如果插入的元素如果已经在 Set 中, 则此元素会被忽略

print(letter1) // 元素没有顺序

letter1.remove("c") // 如果 Set 中有要删除的元素, 则返回该元素否则返回 nil

print(letter1)

letter1.contains("a") // Set 是否包含某个元素

for char in letter1 {
    print(char)
}

print(letter1)

for char in letter1.sorted() {
    print(char)
}

var num1: Set = ["3", "2", "1", "5", "7"]
let num2: Set = ["3", "2", "1", "6", "8"]
let num3: Set = ["3", "2", "1"]

num2 == num3 // 判断两个 Set 包含的元素是否都相同

num3.isSubset(of: num2) // num3 是否是 num2 的子集

num2.isSuperset(of: num3) // num2 是否是 num3 的超集合

num1.isDisjoint(with: num3) // 判断两个集合中的元素是否都不相同

num1.intersection(num2) // 两个 Set 都包含的元素

num1.union(num2) // 合并两个 Set 的所有元素

num1.subtracting(num2) // 只在 num1 中的元素

num1.symmetricDifference(num2) // 不同时在两个集合中, 但在某一个集合中的元素
