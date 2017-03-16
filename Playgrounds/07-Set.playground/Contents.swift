//: Playground - noun: a place where people can play

import UIKit

/// Set: 存储相同类型没有确定顺序的元素, 相同元素只能出现一次

var chars1 = Set<Character>()          // 创建一个 Character 类型的空 Set
let chars2: Set<Character> = []        // 定义空 Set 的简便方式

var letter1: Set = ["a", "b", "c", "d", "e"]
var letter2 = ["a", "b", "c"]          // Set 省略后根据类型推断 letter2 是数组类型

letter1.count                          // 计元素个数
letter1.isEmpty                        // 判断是否为空
letter1.insert("a")                    // 如果插入的元素如果已经在集合中会被忽略
print(letter1)                         // 元素没有顺序
letter1.remove("c")                    // 如果删除的元素在集合中, 返回元素否则返回 nil
print(letter1)
letter1.contains("a")                  // 是否包含某个元素

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

num2 == num3                           // false, 判断两个集合包含的元素是否都相同
num3.isSubset(of: num2)                // true, num3 是 num2 的子集
num2.isSuperset(of: num3)              // true, num2 是num3 的超集合
num1.isDisjoint(with: num3)            // false, 判断两个集合中的元素是否都不相同

num1.intersection(num2)                // 两个集合都包含的元素
num1.union(num2)                       // 两个集合的所有元素
num1.subtracting(num2)                 // 只在 num1 中有的元素
num1.symmetricDifference(num2)         // 不在两个集合中, 但在一个集合中的元素
