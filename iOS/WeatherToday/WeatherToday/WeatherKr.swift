//
//  WeatherKr.swift
//  WeatherToday
//
//  Created by 이조은 on 2022/08/22.
//

import Foundation

/*
{
   "city_name":"서울",
   "state":12,
   "celsius":17.8,
   "rainfall_probability":60
}
 */

//JSON 데이터 모양의 타입 만들기
struct WeatherKr: Codable {
    
    // 변수들을 옵셔널 타입으로 지정해줘야 한다.
    // 안그러면 "The data couldn’t be read because it is missing." 에러가 나옴...
    let city_name: String?
    let state: Double?
    let celsius: Double?
    let rainfall_probability: Int?
    
    // 이렇게 데이터를 정리해주면 viewController에서 데이터를 가공할 필요없이 받아서 쓰기만 하면된다.
//    var nameAndAge: String {
//        return self.name + "(\(self.age))"
//    }
//    var fullAddress: String {
//        return self.addressInfo.city + ", " + self.addressInfo.country
//    }

}
