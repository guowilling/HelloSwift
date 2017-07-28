//: Playground - noun: a place where people can play

import UIKit

/// 类和结构体有相同的语法规则都可以定义属性和添加方法来扩展功能

/**
 类和结构体的共同点:
 1.通过定义属性存储值
 2.通过定义方法提供功能
 3.通过点语法来访问实例所包含的值
 4.通过定义构造器生成初始化值
 5.通过使用扩展增加功能
 6.通过实现协议提供额外功能
 */

/**
 类特点:
 1.允许一个类继承另一个
 2.允许在运行时检查和解释一个实例类型
 3.允许引用计数器对一个类的多次引用
 */

/**
 结构体特点:
 1.结构体通过复制的方式在代码中传递
 2.不使用引用计数器
 */

// 定义方式:
class ClassName { // 类名的首字母大写
    // ...
}

struct StructureName { // 结构体的首字母大写
    // ...
}

struct Resolution { // 定义名为 Resolution 的结构体, 包含宽高两个 Int 类型的存储属性
    var width = 0
    var height = 0
}

class VideoMode { // 定义名为 VideoMode 的类
    var resolution = Resolution()      // 初始化一个 Resolution 结构体实例
    var interlaced = false             // 定义默认值为 false 的布尔类型
    var frameRate = 0.0                // 默认值为 0.0 的 Double 类型
    var name: String?                  // 默认值为 nil 的 String 可选类型
}

// 实例化方式
let someResolution = Resolution() // 属性都被初始化为默认值
let someVideoMode = VideoMode()

print(someResolution.width) // 通过点语法访问属性

someVideoMode.resolution.height = 32 // 可以直接为对象的结构体属性赋值

print(someVideoMode.resolution.height) // 访问结构体属性

let initRes1 = Resolution(width: 64, height: 48) // 结构体设置属性的默认构造器
print("\(initRes1.width)")
print("\(initRes1.height)")
// 类没有默认构造器需要自己定义

// 结构体和枚举是值拷贝
var initRes2 = initRes1 // 相当于拷贝了一份 initRes1 给 initRes2
print(initRes1.width)
print(initRes2.width)

initRes2.width = 32
print(initRes1.width)
print(initRes2.width) // initRes2 的改变不会影响 initRes1

enum Direction { // 枚举
    case North, South, East, West
}
var direct1 = Direction.North
var direct2 = direct1
direct2 = Direction.South
print(direct1) // direct2 的改变不会影响 direct1
print(direct2)

// 类是引用拷贝
let videoM1 = VideoMode()
videoM1.name = "VideoM1"
var videoM2 = videoM1 // videoM1 传递的是一个引用, videoM2 也指向 videoM1 指向的那块存储空间
videoM2.name = "videoM2"
print(videoM1.name!)
print(videoM2.name!) // videoM2 的属性改变会影响带 videoM1

print(videoM1 === videoM2) // 使用 "===" 判断两个引用是否指向同一个对象

/// 类和结构体的使用场景:

/**
 使用结构体的情况:
 1.只是用来封装少量简单的数据值
 2.实例被赋值或传递的时候需要进行值拷贝
 3.存储的值也需要被拷贝
 4.不需要用到继承
 */

/**
 使用类的情况:
 1.需要包含复杂的属性方法
 2.能形成一个抽象的事物描述
 3.需要用到继承
 4.需要用到引用拷贝
 */

// Tips: String Array Dictionary 的底层都是通过结构体实现的, 所以它们在被赋值的时候都是通过值拷贝, 但是 Swift 在内部做了性能优化, 只有在必要的时候才会进行值拷贝.
