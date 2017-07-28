//: Playground - noun: a place where people can play

import UIKit

// 可选链式调用可以在当前值为 nil 的情况下, 调用属性, 方法, 下标
// 如果可选值有值那么调用成功, 如果没有值那么调用失败
// 也可以是多个调用连接在一起, 如果其中有一个节点为nil, 整个调用链都会调用失败返回 nil


// 使用可选链式调用代替强行解包
class Person {
    var home: Home?
}

class Home {
    var numberOfRooms = 1
}

let testPerson = Person()                           // p1 有一个为 nil 的 home 属性
//let roomCount = testPerson.home!.numberOfRooms    // 如果使用 '!' 强制解包会报错: unexpectedly found nil while unwrapping an Optional value

if let roomCount = testPerson.home?.numberOfRooms { // 使用 '?' 来代替 '!'
    print(roomCount)
} else {
    print("home is nil")
}

testPerson.home = Home()
if let roomCount = testPerson.home?.numberOfRooms { // 可选链式调用返回的是一个可选类型
    print(roomCount)
}else {
    print("home is nil")
}


/// 通过可选链式可以调用多层属性, 方法, 下标, 并且能够判断这些属性, 方法, 下标是否可以访问
class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    var address: Address?
    subscript(i: Int) -> Room {          // 通过下标来访问 rooms 中指定位置的元素
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print(numberOfRooms)
    }
}

class People {
    var residence: Residence?
}


let jone = People()
if let roomCount = jone.residence?.numberOfRooms { // 通过可选链式调用访问属性
    print(roomCount)
} else {
    print("residence is nil")
}

let someAddress = Address()
someAddress.buildingNumber = "22"       // 通过可选链式调用来设置属性
someAddress.street = "Acacia Road"
jone.residence?.address = someAddress   // 属性设置失败因为 jone.residence 为 nil

if let identifier = jone.residence?.address?.buildingIdentifier() { // 通过可选链式调用方法
    print(identifier)
} else {
    print("residence is nil")
}

jone.residence = Residence()
jone.residence?.address = someAddress

if let identifier = jone.residence?.address?.buildingIdentifier() {
    print(identifier) // Optional("22") Optional("Acacia Road")
}


jone.residence?.rooms = [Room(name: "Jones"), Room(name: "Johns")] // 添加两个房间名称
if let firstRoomName = jone.residence?[0].name { // 通过可选链式调用访问下标
    print(firstRoomName) // Jones
}


// 多层可选链式调用: 
// 通过可选链式调用非可选类型, 会返回一个可选类型
// 通过可选链式调用可选类型, 返回的依然还是可选类型
if let joneStreet = jone.residence?.address?.street { // 任何一个属性为 nil 调用都会失败
    print(joneStreet) // joneStreet
}

// 方法的可选返回值上进行可选链式调用: 直接在方法的返回值上加 '?'
if let beginWithThe = jone.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    print(beginWithThe) // false
}
