//: Playground - noun: a place where people can play

import UIKit

/// 访问级别限制: Swift 中可以对各种类型进行访问级别控制, 隐藏代码的实现细节, 提供代码访问接口

// 访问控制有两个基本单元, 模块和源文件
// 模块: 一般为单独的框架或者应用, 使用模块需要用 import 导入
// 源文件: 应用或框架中的一个个文件

public class PublicClass {} // 公开访问: 可以在同一模块中访问, 导入该模块后别的模块也能访问
internal class InternalClass {} // 内部访问: 只能在模块内部访问, 模块外部不能访问(默认访问限制级别)
fileprivate class FileprivateClass {} // 文件私有访问: 文件内部可以访问
private class PrivateClass {} // 私有访问: 只能在被限制的作用域内访问

// 元组的访问限制级别, 由元组中访问限制最严格的级别决定
internal let x = 2
private let y = 3
let tupleA = (x, y) // tupleA 的访问级别为 private

// 函数的访问限制级别, 由参数类型和返回类型访问限制最严格的级别决定
private func someFunction() -> (InternalClass, PrivateClass) {
    return (InternalClass(), PrivateClass()) // 函数不加 private 修饰符, 则无法访问 private 的类型
}

// 枚举成员的访问限制和枚举类型相同, 不能单独为枚举成员指定访问限制
public enum CompassPoint {
    case North, South, East, West
}

// 子类的访问级别不得高于父类, 例如父类的访问级别是 internal, 子类的访问级别就不能是 public
public class A {
    func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}

// 常量, 变量, 属性, 下标不能拥有比类型更高的访问级别

private var privateC = PrivateClass() // 如果类型是 private 级别的, 变量的访问级别必须明确为 private

// 通过设置 set, get 方法为常量, 变量, 属性, 下标设置读写权限
struct ChangedString {
    private(set) var numberOfEdits = 0 // 该属性在该结构体中是可读可写的, 但在外面是只读的
    var value: String = "" { // value 为默认访问级别 internal
        didSet {
            numberOfEdits += 1
        }
    }
}
var stringOfEdit = ChangedString()
stringOfEdit.value = "AB"
stringOfEdit.value = "CD"
print(stringOfEdit.numberOfEdits)
//stringOfEdit.numberOfEdits = "XY" // ❌ numberOfEdits 属性的 set 方法限制类型为 private, cannot assign to property: 'numberOfEdits' setter is inaccessible
