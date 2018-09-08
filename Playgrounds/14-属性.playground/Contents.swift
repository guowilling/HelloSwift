//: Playground - noun: a place where people can play

import UIKit

/// 属性: 属性分为用来存储值的属性和用来计算值的属性

/// 存储属性可用于类, 结构体
/// 计算属性可用于类, 结构体, 枚举

// 存储属性: 用于类或结构体中存储常量或变量
struct Location {
    var x: Double
    let y: Double
}

var position1 = Location(x: 22.22, y: 33.33) // 实例赋值给变量
position1.x = 20 // 变量存储属性可以修改
//position1.y = 30 // ❌ 编译报错: 常量存储属性不可修改

let position2 = Location(x: 20.2, y:30.3 ) // 实例赋值给常量
//position2.x = 22.22 // ❌ 编译报错: 变量属性也不可修改
// 原因: 结构体是值类型, 值类型被声明为常量的时候, 其所有属性都是常量

class Address {
    let city = "Hangzhou"
    var town: String?
}
let address1 = Address() // 实例赋值给常量
address1.town = "CangQian" // 变量属性仍然可变
// 原因: 类是引用类型, 引用类型被声明为常量的时候, 仍可以修改变量属性

// 延迟加载存储属性, 关键字: lazy
class Data {
    var fileName = "data.plist"
    // 耗时的数据加载...
}

class DataManger {
    lazy var data = Data() // 使用 'lazy' 第一次访问的时候才会创建, 延时加载只能修饰变量, 因为常量需要初始值
    // 数据操作...
}

let manager = DataManger() // 创建实例的时候并没有创建 data 实例
manager.data // 此时才会创建 data 实例, 执行耗时的数据加载
// Tips: 如果 'lazy' 修饰的属性没有被初始化就被多个线程访问, 则会被初始化多次

// 计算属性: 不直接存储值而是提供了 set 和 get 方法
struct Size {
    var width = 0.0
    var height: Double {
        get { // get 方法必须有返回值
            print("get")
            return 10.0
        }
        set {
            print("set")
            width = 20.0
        }
    }
}
var size1 = Size()
size1.height = 17 // 设置 height 值时会调用 set 方法
print(size1.width)
print(size1.height)

// 只读属性: 只有 get 方法, 没有 set 方法的属性
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double { // 计算属性必须用 var 修饰, 因为计算值不固定
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print(fourByFiveByTwo.volume) // 可以通过点语法访问
//fourByFiveByTwo.volume = 20.0 // ❌ 编译报错: 不能设置新值

// 属性观察器: willSet didSet, 只要为属性设置新值就会调用属性观察器
class StepCounter {
    var totalSteps: Int = 0 { // 一定要设置初始值
        willSet { // willSet 在新值被设置之前调用
            print(newValue)
            print(totalSteps)
        }
        didSet(oldSteps) { // didSet 在新值被设置之后调用
            print(oldSteps)
            print(totalSteps)
        }
        // willSet 会将新的属性值传入 newValue 参数, didSet 会将旧的属性值传入 oldSteps
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 5 // newValue:5 oldSteps: 0
stepCounter.totalSteps = 55 // newValue:55 oldSteps: 5

// 全局变量和局部变量:
// 全局变量是在函数, 方法, 闭包, 或任何类型之外定义的变量
// 局部变量是在函数, 方法, 闭包, 内部定义的变量

// 实例属性: 每创建一个实例, 该实例都会拥有一套属于自己的值, 实例之间的属性相互独立
// 类型属性: 无论创建多少个该类型的实例, 该属性都只有唯一一份

struct SomeStruct {
    static var typeProperty = "Value" // 使用 static 定义类型属性
}
print(SomeStruct.typeProperty) // 类型属性直接通过其本身来访问
SomeStruct.typeProperty = "Another value" // typeProperty 为 var 类型
print(SomeStruct.typeProperty)

class SomeClass {
    static var typeProperty = "Value"
    static var computedTypeProperty: Int {
        return 6 // 可以通过闭包返回属性值
    }
}
print(SomeClass.computedTypeProperty)
