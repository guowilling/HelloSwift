//: Playground - noun: a place where people can play

import UIKit

/// ARC(Auto Reference Counteting)自动引用计数: Swift 通过 ARC 来自动管理内存

// 工作机制: 为了保证实例在使用的过程中不被销毁, ARC 会自动计算一个实例被引用的次数, 只要引用次数不等于0, 该实例就不会被销毁

// 结构体和枚举是值类型, 自动引用计数只用于引用类型

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) 正在被初始化")
    }
    deinit {
        print("\(name) 即将被销毁")
    }
}

var person1: Person? // 可选类型的变量为了置为 nil
var person2: Person?
var person3: Person?
person1 = Person(name: "Dariel") // Person 实例与 person1 建立了强引用关系
person2 = person1
person3 = person1
// 目前该实例共有三个强引用

person1 = nil
person2 = nil // 此时还有一个强引用, 实例不会被销毁
person3 = nil
// 最后一个强引用被断开, ARC 会销毁该实例

// 循环引用: 两个实例互相持有对方的强引用
class People {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment?
    deinit {
        print("People 被销毁")
    }
}

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: People?
    deinit {
        print("Apartment 被销毁")
    }
}

var people1: People? = People(name: "Dariel")
var apartment1: Apartment? = Apartment(unit: "5A")

people1!.apartment = apartment1 // 两者相互引用
apartment1?.tenant = people1 // 且都是强引用
people1 = nil
apartment1 = nil
// 两个引用都置为 nil 了, 但是实例并没有销毁

// 循环强引用的解决办法: 
// 1.弱引用和无主引用, 对于在生命周期会变为 nil 的实例使用弱引用
// 2.对于初始化后不能被赋值为 nil 的实例使用无主引用

class OtherPeople {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: OtherApartment?
    deinit {
        print("\(name) 被销毁")
    }
}

// weak
class OtherApartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: OtherPeople? // weak 关键字表示该变量为弱引用
    deinit {
        print("\(unit) 被销毁")
    }
}

var otherPeople1: OtherPeople? = OtherPeople(name: "Dariel")
var otherApartment1: OtherApartment? = OtherApartment(unit: "5A")
otherPeople1!.apartment = otherApartment1 // 两者相互引用
otherApartment1?.tenant = otherPeople1 // tenant 是弱引用
otherPeople1 = nil
otherApartment1 = nil
// 两个实例的 deinit 都会执行

// unowned
class Dog {
    let name: String
    var food: Food?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) 被销毁")
    }
}

class Food {
    let number: Int
    unowned var owner: Dog // unowned 关键字表示该变量为无主引用
    init(number: Int, owner: Dog) {
        self.number = number
        self.owner = owner
    }
    deinit {
        print("Food 被销毁")
    }
}

var dog1: Dog? = Dog(name: "Kate")
dog1?.food = Food(number: 6, owner: dog1!) // dog 强引用 food, 而 food 对 dog 是无主引用
dog1 = nil // 这样就能同时销毁两个实例了

// 如果互相引用的两个属性都为可选类型, 也就是可以为 nil, 比较适合用弱引用来解决
// 如果互相引用的两个属性, 只有一个属性为可选类型, 那么适合用无主引用来解决

// 但是如果两个属性都不能是可选类型呢, 一个使用无主属性, 另一个使用隐式解析可选属性
class Country {
    let name: String
    var capitalCity: City! // City 后加 '!' 为隐式解析可选属性, 类似可选类型默认值为 nil, 初始化完成后可以当非可选类型使用
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
    deinit {
        print("Country 被销毁")
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
    deinit {
        print("City 被销毁")
    }
}

var country: Country? = Country(name: "China", capitalName: "HangZhou") // 创建两个实例
print(country!.name) // China
print(country!.capitalCity.name) // HangZhou
country = nil // 同时销毁两个实例

// 闭包也是引用类型, 也会引起循环引用
class Element {
    let name: String
    let text: String?
    // 闭包 '() -> String' 相当于没有参数, 返回 String 类型的函数
    lazy var group: () -> String = { [unowned self] in // 定义捕获列表, self 变为无主引用
        if let text = self.text {
            return "\(self.name), \(text)"
        } else {
            return "\(self.name)"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) 被销毁")
    }
}

var aElement: Element? = Element(name: "Hello", text: "Alex")
print(aElement!.group()) // 闭包和实例相互引用
aElement = nil // 闭包里的 self 为无主引用, 所以能解除循环引用
