//: Playground - noun: a place where people can play

import UIKit

/// 构造过程: 通过自定义构造器对类, 结构体, 枚举的实例进行初始化操作

// 构造器类似于不带参数的构造方法

struct Weather {
    var temperature: Double // 可以直接给属性设置默认值
    init() { // 不带参数的构造方法
        temperature = 26.0 // 通常在构造器中给属性赋初值
    }
}
var aWeather = Weather() // 初始化的过程会调用构造方法
print(aWeather.temperature)

struct Point {
    var x = 2.0, y = 4.0
    let z: Double
    // 自定义构造函数, fromPointX 外部名称, pointX 内部名称, '_' 省略外部名称
    // 如果没有提供外部名称, 编译器会自动生成一个和内部名称相同的外部名称
    init(fromPointX pointX: Double, _ pointY: Double) {
        x += pointX
        y += pointY
        z = pointX // 常量在赋值后不能再更改
    }
}

let point = Point(fromPointX: 3.0, 3.0) // 使用自定义构造函数创建实例
print("x: \(point.x), y: \(point.y)")

// 默认构造器: 如果结构体或类的所有属性都有默认值, 同时没有自定义构造函数, 编译器会自动生成一个默认构造函数
class List {
    var name : String? // 可选类型默认值为 nil
    var quantity = 1
    var purchased = false
}
var item = List() // 使用默认构造函数创建实例
print("name: \(item.name), quantity: \(item.quantity), purchased: \(item.purchased)")

struct Size {
    var width = 0.0, height = 0.0
}
var size1 = Size(width: 3.0, height: 4.0) // 结构体有一个逐一构造函数

// 值类型的构造代理: 构造函数调用其它构造函数来完成部分实例化工作
struct RectPoint {
    var x = 0.0, y = 0.0
}

struct RectSize {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = RectPoint()
    var size = RectSize()
    init() {} // 没有执行任何构造过程, 默认返回实例
    init(origin: RectPoint, size: RectSize) {
        self.origin = origin
        self.size = size
    }
    init(center: RectPoint, size: RectSize) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: RectPoint(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect() // x, y, width, height 都为 0.0

// size 和 origin 的参数赋值给对应的存储属性
let originRect = Rect(origin: RectPoint(x: 2.0, y: 2.0), size: RectSize(width: 2.0, height: 2.0))

// 先计算 origin 的坐标再调用其他构造器进行赋值
let centerRect = Rect(center: RectPoint(x: 3.0, y: 3.0), size: RectSize(width: 2.0, height: 2.0))

// 类的构造: 类的所有属性包括继承自父类的都必须在构造过程中设置初始值
// 类有两种构造器: 指定构造器 和 便利构造器

//init(参数) { // 指定构造器初始化类中的所有属性
    // 初始语句 // 调用父类构造器来完成父类的初始化
//}

//convenience init(参数) { // 便利构造器 init 前加关键字 convenience
    // 初始语句 // 次要的构造器, 一般用于使类的构造过程更清晰
//}

// Tips: 子类的指定构造器会调用父类的指定构造器, 便利构造器必须调用该类的指定构造器


/// 构造器的继承和重写

class Vehicle {
    var wheels = 1
    var description: String { // 返回 String 的计算型属性
        return "有\(wheels)个轮子"
    }
}
let vehicle = Vehicle() // 系统会提供指定构造器创建 wheels 为 1 的实例
print(vehicle.description)

class Bicycle: Vehicle {
    override init() { // 构造器和父类相同要加 override
        super.init() // 完成父类的初始化
        wheels = 2 // 设置新值, 但是不能修改继承的常量属性
    }
}
let bicycle = Bicycle()
print(bicycle.description)

// 指定构造器 和 便利构造器实践
class Food {
    var name: String
    init(name: String) { // 指定构造器
        self.name = name
    }
    convenience init() { // 便利构造器
        self.init(name: "名字未知") // 调用指定构造器
    }
}
let nameMeat = Food(name: "Becon")
print(nameMeat.name)
let unknownMeat = Food() // 调用没有参数的便利构造器
print(unknownMeat.name)

class Recepe: Food {
    var quantity: Int
    init(name: String, quantity: Int) { // 指定构造器
        self.quantity = quantity // 初始化自身的属性
        super.init(name: name) // 初始化父类的属性
    }
    override convenience init(name: String) { // 便利构造器重写了父类的指定构造器
        self.init(name: name, quantity: 1) // 调用指定构造器 quantity 为 1
    }
}
let recepe1 = Recepe()
print("name: \(recepe1.name), quantity: \(recepe1.quantity)")
let recepe2 = Recepe(name: "Beef")
print("name: \(recepe2.name), quantity: \(recepe2.quantity)")
let recepe3 = Recepe(name: "Egg", quantity: 2)
print("name: \(recepe3.name), quantity: \(recepe3.quantity)")

// 可失败构造器: 类, 结构体, 枚举在定义的时候有可能会失败, 可以定义可失败构造器
struct Animal {
    let species: String
    init?(species: String) { // 语法: init?(参数) {}
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}
let cat = Animal(species: "Cat") // 失败构造器会创建一个类型为自身的可选类型对象
print(cat) // Optional(Animal(species: "Cat"))

let someAnimal = Animal(species: "") // 传入空字符串会导致构造失败
print(someAnimal) // nil

// 枚举类型的可失败构造器
enum Unit {
    case Alex, Bill, Carle
    init?(char: Character) {
        switch char {
        case "A":
            self = .Alex
        case "B":
            self = .Bill
        case "C":
            self = .Carle
        default:
            return nil
        }
    }
}
let unit1 = Unit(char: "B") // Bill
let unit2 = Unit(char: "D") // nil

// 必要构造器: 子类必须实现的构造器
class SomeClass {
    required init() { // 使用 required 修饰符表示该类的子类都必须实现该构造器
        // ...
    }
}

class Subclass: SomeClass {
    required init() { // 此时重写父类的必要构造器时, 不需要添加 override 修饰符, 但是子类也需要添加 required
        // ...
    }
}

// 通过闭包或函数设置属性的默认值
class OtherClass {
    let someProperty: String = {
        return "someValue" // 返回值的类型要和 String 一致
    }() // 后面加 '()' 表示立即执行此闭包, 不加就相当于把闭包本身赋值给属性
}
let oClass = OtherClass()
print(oClass.someProperty)
