//: Playground - noun: a place where people can play

import UIKit

/// 继承: 一个类可以继承另一个类的方法, 属性, 及其它特征

class Vehicle { // 机动车父类
    var currentSpeed = 5.0 // 速度属性
    var description: String { // 描述速度的只读计算属性
        get {
            return "\(currentSpeed) 公里/每小时"
        }
    }
    func makeNoise() {
        // 空实现, 子类重写
    }
}

let someVehicle = Vehicle()
print("速度: \(someVehicle.description)")

class Bicycle: Vehicle { // Bicycle 继承自 Vehicle, 拥有父类的所有特性
    var hasTwoWheels = true
}
let bicycle = Bicycle()
bicycle.hasTwoWheels = true
bicycle.currentSpeed = 15.0 // 继承自父类的属性
print("速度: \(bicycle.description)")

class Tandem: Bicycle { // Tandem 继承自 Bicycle
    var canRideByTwoPeople = true
}
let tandem = Tandem()
tandem.hasTwoWheels = true
tandem.canRideByTwoPeople = true
tandem.currentSpeed = 10.0
print("速度: \(tandem.description)")

/// 重写: 子类可以对继承自父类的类方法, 实例方法, 实例属性, 下标进行重写

class Train: Vehicle {
    var passenger = 0
    
    override var currentSpeed: Double {
        didSet { // 重写父类属性的观察器
            passenger = Int(currentSpeed / 10)
        }
    }
    override func makeNoise() { // 重写使用 override 关键字
        print("哐当哐当哐当哐")
    }
    override var description: String { // 重写父类的属性
        return super.description + ", 有\(passenger)个乘客"
    }
}
let train = Train()
train.makeNoise() // 调用重写的方法
print(train.description)
train.currentSpeed = 20 // 调用重写的属性观察器的 didSet 方法
print(train.description)

class Animal {
    final func run() { // 如果方法, 属性, 下标不想被重写可以使用关键字 final 修饰
        print("Running!")
    }
}

final class Dog: Animal { // class 使用 final 关键字表示该类不能被继承
    //override func run() {} // ❌ 编译报错: instance method overrides a 'final' instance method
}
