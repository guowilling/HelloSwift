//: Playground - noun: a place where people can play

import UIKit

/// 下标: 定义在类, 结构体, 枚举中可以快速访问集合元素

// 语法定义:
//subscript(index: Int) -> Int {
//    get {
//        // 返回整数类型
//    }
//    set(newValue) {
//        // 赋值操作
//    }
//}

struct TimeTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    } // 省略 set 即为只读下标
}
let threeTimesTable = TimeTable(multiplier: 3) // 通过构造函数赋值给实例成员属性
print(threeTimesTable[6]) // 通过下标访问实例, 传入参数得到返回值

struct Matrix {
    var rows: Int, columns: Int
    subscript(row: Int, column: Int) -> Int { // 二维下标
        get {
            return rows + columns
        }
        set {
            rows += newValue // newValue 默认参数
            columns += newValue
            
            rows += row
            columns += column
        }
    }
}
var matrix = Matrix(rows: 2, columns: 3)
matrix[1, 1] = 5 // 调用下标的 set 和 get 方法
print(matrix.rows)
print(matrix.columns)
print(matrix[1, 1])
