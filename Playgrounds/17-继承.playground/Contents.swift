//: Playground - noun: a place where people can play

import UIKit

// 继承: 一个类可以继承另一个类的方法, 属性, 及其它特征


class Vehicle {                           // 机动车父类
    var currentSpeed = 5.0                // 速度属性
    var description: String {             // 描述速度的只读计算属性
        get {
            return "\(currentSpeed)公里/每小时"
        }
    }
    func makeNoise() {
        // 空实现...
    }
}

let someVehicle = Vehicle()
print("速度: \(someVehicle.description)")

class Bicycle: Vehicle { // Bicycle 继承自 Vehicle, 获得父类的所有特性
    var hasTwoWheels = true
}
let bicycle = Bicycle()
bicycle.hasTwoWheels = true
bicycle.currentSpeed = 15.0              // 父类的属性
print("速度: \(bicycle.description)")

class Tandem: Bicycle { // Tandem 继承自 Bicycle
    var canRideByTwoPeople = true
}
let tandem = Tandem()
tandem.hasTwoWheels = true
tandem.canRideByTwoPeople = true
tandem.currentSpeed = 10.0
print("速度: \(tandem.description)")


// 重写: 子类可以对继承自父类的类方法, 实例方法, 实例属性, 下标进行重写
class Train: Vehicle {
    var passenger = 0
    
    override var currentSpeed: Double {
        didSet { // 重写父类属性的观察器
            passenger = Int(currentSpeed / 10)
        }
    }
    override func makeNoise() { // 重写需要在加上 override 关键字
        print("哐当哐当哐当哐")
    }
    override var description: String { // 重写父类的属性
        return super.description + ", 有\(passenger)个乘客."
    }
}
let train = Train()
train.makeNoise()                      // 调用重写的方法
print(train.description)
train.currentSpeed = 200               // 调用重写的属性观察器的didSet方法
print(train.description)

class Animal {
    final func run() { // 如果方法, 属性, 下标不想被重写可以在最前面添加关键字 'final'
        print("Running!")
    }
}

final class Dog: Animal {                 // class 前添加 final 的类不可以再被继承
    //override func run() {}              // ❌ instance method overrides a 'final' instance method
}
