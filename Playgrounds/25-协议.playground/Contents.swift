//: Playground - noun: a place where people can play

import UIKit

// 协议: 定义一个规则去实现特定功能
// 类, 结构体, 枚举都可以遵守这个协议, 并为这个协议的规则提供具体的实现

protocol SomeProtocol1 { // 协议语法
    // 协议内容
}

struct SomeStructure: SomeProtocol1 { // ':' 后面加协议名称, 多个协议之间用逗号隔开, 遵守协议
    // 结构体内容
}

class SomeClass: NSObject, SomeProtocol1 { // 有父类的类遵守协议, 要将父类名放在协议名之前并用 ',' 隔开
    // 类的实现
}


// 协议中定义属性: 协议中的属性可以是实例属性也可以是类属性, 协议中的属性只能指定名称和类型以及读写性
protocol SomeProtocol2 {
    var mustBeSettable: Int { get set }  // 类型后面加{ get set }表示该属性可读可写
    var onlyRead: Int { get }            // 类型后面加{ get }表示该属性可读
    static var someTypeProperty: Int { get set } // 关键字 static 表示类属性
}

protocol FullyNamed { // 这个协议中只包含一个实例属性
    var fullName: String { get }
}

struct Person: FullyNamed {             // Person 遵守 FullyNamed 协议表示必需要实现 fullName 属性
    
    var name: String
    
    var fullName: String {              // 这个 fullName 属性可以实现为只读的
        return "Barack Hussein \(name)"
    }
}
let obama = Person(name: "Obama")
print(obama.fullName)


// 协议中定义方法: 协议可以要求实现某些指定的实例方法和类方法, 定义的方式和普通方法相同, 但不需要大括号和方法体
protocol SomeProtocol3 {
    static func someTypeMethod()       // static 表示是类方法
}

protocol RandomNum {
    func random() -> Int               // 要求遵守协议的类型必须实现 random 方法
}
class RandomNumGenerator: RandomNum {
    func random() -> Int {
        return Int(arc4random() % 10)
    }
}
let randomNum = RandomNumGenerator()
print(randomNum.random()) // 0 ~ 9 的随机数


// mutating 关键字在协议中的应用: 结构体和枚举即值类型的实例方法中, 不能直接修改其实例属性, 需要在其方法前面加 mutating 关键字
protocol toggleProtocol {
    mutating func toggle() // 需要结构体和枚举遵守的协议方法, 需要添加 mutating 关键字
}

enum Toggle: toggleProtocol {
    case Off, On
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}

var lightSwitch = Toggle.Off
lightSwitch.toggle()           // 置反
print(lightSwitch == .On)


// 协议中定义构造器: 写下构造器的声明, 不需要写花括号和构造器实现
protocol SomeProtocol4 {
    init(someParameter: Int)
}

class SomeInitClass: SomeProtocol4 {
    required init(someParameter: Int) { // 遵守协议的构造器都必须在前面添加 required 修饰符, 来确保所有子类都实现此构造器
        // 构造器实现部分
    }
}


// 协议作为类型使用: 可以作为函数, 方法, 构造器中的参数类型或返回值类型, 作为常量变量或属性的类型, 作为数组字典或其他容器中元素的类型
class Dice {                           // 定义一个类
    let generator: RandomNum           // 协议类型的存储属性
    
    init(generator: RandomNum) {
        self.generator = generator
    }
    
    func roll() -> Int {               // 产生一个随机数
        return generator.random()
    }
}

class RandomNumGenerator1: RandomNum { // 定义一个类遵守该协议
    func random() -> Int {
        return Int(arc4random() % 10)
    }
}

var d6 = Dice(generator: RandomNumGenerator1()) // 就可以将遵守该协议的类当作参数了
print(d6.roll()) // 随机数


// 代理模式: 可以将类或结构体的一些功能委托给其它类去实现
// 代理可以用来响应事件或接收外部数据源数据
protocol BabyDelegate {
    func feedBaby(baby: Baby)        // 代理中有一个喂食物的方法
}

class Baby {
    var needNumFood: Int?            // baby 需要的食物数量
    var babyDelegate: BabyDelegate?  // 代理属性
    
    func eat() {
        babyDelegate?.feedBaby(baby: self)  // 调用代理方法
    }
}

class Nanny: BabyDelegate {          // nanny 遵守代理
    func feedBaby(baby: Baby) { // nanny实现喂食物的代理方法
        baby.needNumFood = 10
        print("喂 baby 食物: \(baby.needNumFood!)")
    }
}

let baby = Baby()
let nanny = Nanny()
baby.babyDelegate = nanny            // baby 委托给 nanny
baby.eat()                           // baby 调用吃的方法委托 nanny 喂食物


// extension 中实现协议
protocol SomeProtocol5 {
    // 协议内容
}
extension Nanny: SomeProtocol5 {    // 扩展中遵守协议的效果和原始类中一样
    // 实际开发中实现协议的时候推荐这样做, 利于提高代码的可读性
}


// 通过扩展遵守协议: 当一个类实现了协议中的方法, 却还没有遵守该协议时, 可以通过空扩展体来遵守该协议
protocol SomeProtocol6 {
    var description: String {
        get
    }
}
struct Cat {                         // 并没有遵守协议
    var name: String
    var description: String {        // 实现了协议中的方法
        return "A cat named: \(name)"
    }
}
extension Cat: SomeProtocol6 {}      // 扩展中实现协议


let lucyTheCat = Cat(name: "lucy")
let sp: SomeProtocol6 = lucyTheCat   // 遵守协议
print(sp.description)                // A cat named: lucy


// 协议本身也是种类型可以放到集合中使用
let things: [SomeProtocol6] = [lucyTheCat] // 用于存放遵守协议的类

for thing in things {
    print(thing.description) // A cat named: lucy
}


// 协议的继承和类的继承相似, 但是协议可以继承多个其它协议
protocol InheritingProtocol: SomeProtocol5, SomeProtocol6 {
    // 任何实现 InheritingProtocol 协议的同时也必须实现 SomeProtocol5 和 SomeProtocol6
}


// 类的专属协议: 通过添加 class 关键字来限制协议只能被类遵守
protocol SomeClassOnlyProtocol: class, InheritingProtocol { // class 关键字必须在最前面
    // 如果被结构体或枚举继承则会编译错误
}


// 协议合成: 同时采纳多个协议, 多个协议之间用 '&' 分隔
// 协议合成不会生成新的协议, 只是一个临时局部的
protocol Name {
    var name: String { get }
}
protocol Age {
    var age: Int { get }
}

struct People: Name, Age {          // 遵守 name, age 两个协议
    var name: String
    var age: Int
}

func say(to people: Name & Age) {   // 参数类型: Name & Age
    print("This is \(people.name), age is \(people.age)") // This is Joan, age is 20
}

let aPeople = People(name: "Joan", age: 20)
say(to: aPeople)                    // 只要遵守这两个协议的对象都能被传进去作为参数


// 检查协议的一致性, 如果不一致可以进行转换
// 'is' 检查实例是否符合某个协议, 符合返回 true, 否则返回 false
// 'as?' 如果符合某个协议类型, 则返回类型为该协议类型的可选值, 否则返回nil
// 'as!' 强行转化实例为某个协议类型, 如果失败会导致运行时崩溃

protocol HasArea {                  // HasArea 协议
    var area: Double { get }
}
class Circle: HasArea {             // 遵守 HasArea 协议
    let pi = 3.1415927
    var radius: Double
    var area: Double {
        return pi * radius * radius
    }
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {            // 遵守 HasArea 协议
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

// 所有类对象作为 AnyObject 对象放到数组中
let objects: [AnyObject] = [ Circle(radius: 3.0), Country(area: 23460), Animal(legs: 4)]

for object in objects {
    if let objectWithArea = object as? HasArea { // 判断 object 是否遵守 area 协议
        print(objectWithArea.area)               // 此时的 objectWithArea 是 area 协议类型的实例
        //print(objectWithArea.pi)               // ❌ 所以只有 area 属性才能被访问
    } else {
        print("没有遵守 area 协议")
    }
}


// 协议的可选性: 协议中的所有方法和属性并不是一定都要实现的, 可以在可实现可不实现的前面加 optional 关键字
// 使用可选方法或属性时, 它们的类型会自动变为可选的

// 注意: 可选的协议前面需要加 @objc 关键字
// @objc 表示该协议暴露给 ObjC 代码, 但即使不与 ObjC 交互只想实现可选协议要求, 还是要加 @objc 关键字
// 带有 @objc 关键字的协议只能被 ObjC 类, 或者带有 @objc 关键字的类遵守, 结构体和枚举都不能遵守

@objc protocol CounterDataSource {
    @objc optional var fixAdd: Int { get }             // 可选属性
    @objc optional func addForCount(count: Int) -> Int // 可选方法
}

class Counter: CounterDataSource {
    var count = 0
    var dataSource: CounterDataSource?
    func add() {
        if let amount = dataSource?.addForCount?(count: count) { // 使用可选绑定和两层可选链式来调用可选方法
            count += amount
        } else if let amount = dataSource?.fixAdd {
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    let fixAdd = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
counter.add()                      // 增加 3
counter.add()                      // 增加 3
print(counter.count)               // 6


// 协议扩展: 可以通过扩展来为遵守了协议的类添加属性, 方法, 下标
protocol RandomNumG {
    func random() -> Int
}
class RandomNumGen: RandomNumG {
    var description: String {
        return "RandomNumGen"
    }
    
    func random() -> Int {
        return Int(arc4random() % 10)
    }
}

let randomNumG = RandomNumGen()
print(randomNumG.random())

extension RandomNumG {
    
    var description: String {
        return "extension"
    }
    
    func randomBool() -> Bool {        // 可以通过扩展来为协议添加方法
        return random() > 5            // 随机数是否大于 5
    }
}
print(randomNumG.randomBool())
print(randomNumG.description)          // 协议扩展内容的优先级低于原类
