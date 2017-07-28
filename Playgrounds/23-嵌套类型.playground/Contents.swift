//: Playground - noun: a place where people can play

import UIKit

/// 类型嵌套: 可以在允许类型嵌套的类型中嵌套类, 结构体, 枚举并且支持多层嵌套

// 值类型的嵌套
struct NestedStruct {
    enum enumType1: Character { // 结构体中嵌套枚举
        case enumValue1 = "A", enumValue2 = "B", enumValue3 = "C"
    }
    enum enumType2: Int {
        case two = 2, three, four
        struct Values { // 枚举中嵌套结构体
            enum num: Int { // 结构体中再嵌套枚举
                case num1 = 1, num2, num3
            }
        }
    }
}
print(NestedStruct.enumType1.enumValue2.rawValue)
print(NestedStruct.enumType2.Values.num.num2.rawValue)
// 枚举和结构体都是值类型, 可以直接通过类名称调用

// 引用类型的嵌套
class ClassType1 {
    class ClassType2 { // 引用类型中嵌套引用类型
        func hello() -> String {
            return "Hello"
        }
    }
    enum enumType2: Int { // 引用类型中嵌套值类型
        case two = 2, three, four
        struct Values {
            enum num: Int {
                case num1 = 1, num2, num3
            }
        }
    }
}
let someClass = ClassType1.ClassType2() // 引用类型嵌套也是在类名前面加外部类型的类名
print(someClass.hello())
print(ClassType1.enumType2.Values.num.num1.rawValue)
