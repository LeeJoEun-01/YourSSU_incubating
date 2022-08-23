//
//  Friend.swift
//  weather_practice
//
//  Created by 이조은 on 2022/08/22.
//

import Foundation
/*
 {
 "name":"하나",
 "age":22,
 "address_info":{
    "country":"대한민국",
    "city":"울산"
    }
 }
 */

//JSON 데이터 모양의 타입 만들기
struct Friend: Codable {
    
    struct Address: Codable {
        let country: String
        let city: String
    }
    
    let name: String
    let age: Int
    let addressInfo: Address //JSON에서는 address_info다
    
    // 이렇게 데이터를 정리해주면 viewController에서 데이터를 가공할 필요없이 받아서 쓰기만 하면된다.
    var nameAndAge: String {
        return self.name + "(\(self.age))"
    }
    var fullAddress: String {
        return self.addressInfo.city + ", " + self.addressInfo.country
    }
    //JSON의 프로퍼티 이름과 맞지 않기 때문에 CodingKeys 열거를 만든다.
    enum CodingKeys: String, CodingKey {
        // case에다가 각각의 프로퍼티 이름을 쓴다.
        case name, age
        case addressInfo = "address_info"
    }
}
