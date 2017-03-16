//: Playground - noun: a place where people can play

import UIKit

// 类型转换: 使用 'is' 和 'as' 来检查类型和转换类型

class Media {                             // 基类
    var name: String                      // 基类属性
    init(name: String) {
        self.name = name
    }
}
class Movie: Media {
    var director: String                  // 子类属性
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: Media {
    var artist: String                    // 子类属性
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

// library 的类型为 [Media]
let library = [Movie(name: "AF", director: "Camelon"),
                Song(name: "CV", artist: "Lona"),
                Song(name: "CV", artist: "Lona")]

let item1 = library[0]                    // item1 的类型为父类 Media 而不是 Movie


// 检查类型: 使用类型检查符 'is' 来检查一个实例是否是特定子类型, 是返回 true 否则返回 false
var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}
print("movieCount: \(movieCount), songCount: \(songCount)")


// 向下类型转换: 通过类型转换符 'as?' 或 'as!' 将某个类型转换为实际的子类型
for item in library {
    if let movie = item as? Movie { // 不确定向下类型转换是否可以成功用 as?, 此时会返回一个可选值
        print("director: \(movie.director)")
    } else if let song = item as? Song { // 使用可选绑定来解包
        print("artist: \(song.artist)")
    }
}
// 如果确定类型转换会成功可以使用强制类型转换 'as!', 但是如果转换失败会造成程序崩溃


// 使用 Any 和 AnyObject 进行类型转换
// AnyObject: 表示任何类型的实例
// Any: 表示任何类型

// 定义一个 AnyObject 类型的数组设置3个 Movie 类型的实例
let objects: [AnyObject] = [Movie(name: "AF", director: "Camelon"),
                            Movie(name: "AF", director: "Piter"),
                            Movie(name: "AF", director: "William")]
for object in objects {
    let movie = object as! Movie          // 使用 'as!' 强制类型转换并解包 Movie 类型
    print(movie.director)
}

for object in objects as! [Movie] {       // 或者直接将 objects 转化成 [Movie] 类型
    print(object.director)
}

var things = [Any]()                      // 定义一个可以存储任何类型的数组
things.append(2)                          // 添加一个 Int 类型的整数
things.append(3.3)                        // Double 类型
things.append("aString")                  // String 类型
things.append((2, 3))                     // 元组类型
things.append({ (name: String) -> String in "Hello, \(name)"}) // 闭包类型

// 使用 as 来转化成具体类型
for thing in things {
    switch thing {
    case let intValue as Int:
        print(intValue)
    case let doubleValue as Double:
        print(doubleValue)
    case let stringValue as String:
        print(stringValue)
    case let (x, y) as (Int, Int):
        print("(\(x), \(y))")
    case let stringConverter as (String) -> String:
        print(stringConverter("Lily"))
    default:
        print("Something else")
    }
}
