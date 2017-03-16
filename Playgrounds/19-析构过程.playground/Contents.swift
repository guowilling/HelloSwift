//: Playground - noun: a place where people can play

import UIKit

// 析构过程: 当一个实例不再需要的时候, Swift 通过自动引用计数去自动清理内存
// 析构器: 析构器只适用于类, 类实例被释放前会自动调用析构器, 析构器用关键字 deinit 标识

class SomeClass {
    deinit {                            // 析构器只能定义在类中
        // ...                          // 子类继承父类, 也就继承了父类的析构器
    }                                   // deinit 相当于 ObjC 的 dealloc
}

// 析构器的实践
class DeinitTest {
    // 属性...
    // 方法...
    deinit {
        print("deinit")
    }
}
var test: DeinitTest? = DeinitTest()   // 定义一个可选类型, 为了置为 nil 释放内存
test = nil                             // 实例没有任何引用后, 系统会调用 deinit 方法, 回收内存
