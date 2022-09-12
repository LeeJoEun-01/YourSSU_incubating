import UIKit
import os
import Foundation

//protocol Talkable {
//
//    //프로퍼티 요구
//    var topic: String { get set }
//    var language: String { get }
//
//    //메서드 요구
//    func talk()
//
//    //이니셜라이저 요구
//    init(topic: String, language: String)
//}
//
////Person 구조체는 Talkable 프로토콜을 채택
//struct Person: Talkable{
//    //프로퍼티 요구 준수
//    var topic: String
//    //만약 프로토콜에서 프로퍼티 요구할 때 var language: String { get set } 이라고 썼으면 let을 사용하면 안된다.
//    let language: String
//
////    //읽기전용 프로퍼티 요구는 연산 프로퍼티로 대체가 할 수 있다.
////    var language: String {return "한국어"}
////
////    //물론 읽기, 쓰기 프로퍼티도 연산 프로퍼티로 대체할 수 있다.
////    var subject: String = ""
////    var topic: String {
////        set {
////            self.subject = newValue
////        }
////        get {
////            return self.subject
////        }
////    }
//
//    //메서드 요구 준수
//    func talk() {
//        print("\(topic)에 대해 \(language)로 말한다.")
//    }
//    //이니셜라이저 요구 준수
//    init(topic:String, language: String){
//        self.topic = topic
//        self.language = language
//    }
//}
//
//struct Person2: Talkable{
//    var subject: String = ""
//
//    //물론 읽기, 쓰기 프로퍼티도 연산 프로퍼티로 대체할 수 있다.
//    var topic: String {
//        set {
//            self.subject = newValue
//        }
//        get {
//            return self.subject
//        }
//    }
//
//    var language: String {return "한국어"}
//
//    func talk() {
//        print("\(topic)에 대해 \(language)로 말한다.")
//    }
//
//    init(topic:String, language: String){
//        self.topic = topic
//    }
//}
//
//protocol Readable{
//    func read()
//}
//
//protocol Writeable{
//    func write()
//}
//
//protocol ReadSpeakable: Readable{
//    func speak()
//}
//
//protocol ReadWriteSpeakable: Readable, Writeable{
//    func speak()
//}
//
//struct SomeType: ReadWriteSpeakable{
//    func read() {
//        print("Read")
//    }
//    func write() {
//        print("Write")
//    }
//    func speak() {
//        print("Speak")
//    }
//}

//enum VendingMachineError: Error {
//    case invalidInput
//    case insufficientFunds(moneyNeeded: Int)
//    case outOfStock
//}
//
//class VendingMachine {
//    let itemPrice: Int = 100
//    var itemCount: Int = 6
//    var deposited: Int = 0
//
////돈 받기 메서드
//func receiveMoney(_ money: Int) throws {
//
//    // 입력한 돈이 0이하면 오류를 던진다.
//    guard money > 0 else {
//        throw VendingMachineError.invalidInput
//    }
//
//    // 오류가 없으면 정상처리
//    self.deposited += money
//    print("\(money)원 받음")
//    }
//
////물건 팔기 메서드
//func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
//
//    //원하는 아이템의 수량이 잘못 입력되었으면 오류를 던진다.
//    guard numberOfItemsToVend > 0 else{
//        throw VendingMachineError.invalidInput
//    }
//
//    //구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류를 던진다.
//    guard numberOfItemsToVend*itemPrice <= deposited else {
//        let moneyNeeded: Int
//        moneyNeeded = numberOfItemsToVend*itemPrice-deposited
//
//        throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
//    }
//
//     // 구매하려는 수량보다 요구하는 수량이 많으면 오류를 던진다
//        guard itemCount >= numberOfItemsToVend else {
//            throw VendingMachineError.outOfStock
//        }
//
//        // 오류가 없으면 정상처리 한다.
//        let totalPrice = numberOfItemsToVend * itemPrice
//
//        self.deposited -= totalPrice
//        self.itemCount -= numberOfItemsToVend
//
//        return "\(numberOfItemsToVend)개 제공함"
//    }
//}
//
//// 자판기 인스턴스
//let machine: VendingMachine = VendingMachine()
//
//// 판매 결과를 전달받을 변수
//var result: String?
//
//do {
//    result = try machine.vend(numberOfItems: 4)
//}
//result = try? machine.vend(numberOfItems: 2)
//result // Optional("2개 제공함")
//
//result = try? machine.vend(numberOfItems: 2)
//result // nil

//result = try! machine.vend(numberOfItems: 1)
// 런타임 오류 발생!


let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int]
var strings: [String]

doubledNumbers = [Int]()
strings = [String]()

//for number in numbers {
//    doubledNumbers.append(number * 2)
//    strings.append("\(number)")
//}
//
//print(doubledNumbers) // [0, 2, 4, 6, 8]
//print(strings) // ["0", "1", "2", "3", "4"]
//
//// numbers의 각 요소를 2배하여 새로운 배열 반환
//doubledNumbers = numbers.map({ (number: Int) -> Int in
//    return number * 2
//})
//
//// numbers의 각 요소를 문자열로 변환하여 새로운 배열 반환
//strings = numbers.map({ (number: Int) -> String in
//    return "\(number)"
//})
//
//print(doubledNumbers) // [0, 2, 4, 6, 8]
//print(strings) // ["0", "1", "2", "3", "4"]
//
//// 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
//doubledNumbers = numbers.map { $0 * 2 }
//print(doubledNumbers) // [0, 2, 4, 6, 8]

var filterd: [Int] = [Int]()

for number in numbers {
    if number % 2 == 0 {
        filterd.append(number)
    }
}

print(filterd) //[0, 2, 4]

let evenNumbers: [Int] = numbers.filter{ (number: Int)->Bool in
    return number % 2 == 0
}

print(evenNumbers) //[0, 2, 4]

let oddNumbers: [Int] = numbers.filter{
    $0 % 2 != 0
}

print(oddNumbers) //[1, 3]

print("====reduce====")

let someNumbers: [Int] = [2, 8, 15]

var result: Int = 0

for number in someNumbers {
    result += number
}
print(result) //25

let sum: Int = someNumbers.reduce(0, {(first: Int, second: Int)-> Int in
    print("\(first) + \(second)")
    return first+second
})
print(sum) //25

let subtract: Int = someNumbers.reduce(0, {(first: Int, second: Int) -> Int in
    print("\(first) - \(second)")
    return first - second
})
print(subtract) //-25

let sumFromThree = someNumbers.reduce(3) {$0+$1}
print(sumFromThree) //28


let possibleNumbers = ["1", "2", "three", "///4///", "5"]

let mapped = possibleNumbers.map { str in Int(str) }
print(mapped) //[Optional(1), Optional(2), nil, nil, Optional(5)]

let compactMapped = possibleNumbers.compactMap { str in Int(str) }
print(compactMapped) //[1, 2, 5]


let numbers1 = [[1], [2, 3], [4, 5, 6], [7, 8, 9, 10]]

let flatMapped2 = numbers1.flatMap { $0 }
print(flatMapped2) //[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let compactMapped2 = numbers1.compactMap { $0 }
print(compactMapped2) //[[1], [2, 3], [4, 5, 6], [7, 8, 9, 10]]

let numbers2 = [[[1], [2, 3], [4, 5, 6], [7, 8, 9, 10]]]

let flatMapped3 = numbers2.flatMap { $0 }
print(flatMapped3) //[[1], [2, 3], [4, 5, 6], [7, 8, 9, 10]]

let doubleFlatMapped = flatMapped3.flatMap { $0 }
print(doubleFlatMapped) //[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


let myDict: [String: Int] = ["sodeul": 28]


//
//struct Human: Hashable {
//    let name: String
//    let age: Int
//}
//
//let myDictWithStruct: [Human: Int] = [:]
//

class Human {
    let name = "joeun"
    let age = 28
}

extension Human: Hashable {
    static func == (lhs: Human, rhs: Human) -> Bool {
            return lhs.name == rhs.name && lhs.age == rhs.age
        }
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(age)
    }
}

let myDictWithClass: [Human: Int] = [:]

enum Gender {
    case male
}
 
let myDictWithEnum: [Gender: Int] = [:]


//struct Person: Codable {
//    var name: String
//    var age: Int
//}

//let joeun: Person = .init(name: "joeun", age: 22)
//
//let data2 = try? JSONEncoder().encode(joeun)
////print(String(decoding: data!, as: UTF8.self))
//// {"name":"joeun","age":22}

//let data = """
//{
//    "name" : "joeun",
//    "age"  : 22
//}
//""".data(using: .utf8)!
//let joeun = try? JSONDecoder().decode(Person.self, from: data)


struct Person: Codable {
    var name: String
}
    enum CodingKeys: String, CodingKey {
        case name = "Name"
    }

let data = """
{
    "Name" : "joeun"
}
""".data(using: .utf8)!
let joeun = try? JSONDecoder().decode(Person.self, from: data)

protocol SportsPlayer
{
    var FIRSTNAME: String {get set}
    var LASTNAME: String {get set}
    var BORNED: Int {get set}
    var EVENT: String {get set}
    
    init (FIRSTNAME: String, LASTNAME: String, BORNED: Int, EVENT: String)
}

struct SoccerPlayer: SportsPlayer
{
    var FIRSTNAME: String
    var LASTNAME: String
    var BORNED: Int
    var EVENT: String
}


struct FigurePlayer: SportsPlayer
{
    var FIRSTNAME: String
    var LASTNAME: String
    var BORNED: Int
    var EVENT: String
}


var PLAYERS = [SportsPlayer]()
        
        let PLAYER1 = SoccerPlayer(FIRSTNAME: "지성", LASTNAME: "박", BORNED: 1981, EVENT: "축구")
        let PLAYER2 = FigurePlayer(FIRSTNAME: "연아", LASTNAME: "김", BORNED: 1990, EVENT: "피겨")
        
        PLAYERS.append(PLAYER1)
        PLAYERS.append(PLAYER2)
        
        for item in PLAYERS
        {
            print("\(item.LASTNAME)\(item.FIRSTNAME)선수는 \(item.BORNED)년생이며, \(item.EVENT)선수 입니다.")
        }
