//
//  UserInfomation.swift
//  SignUp
//
//  Created by 이조은 on 2022/08/07.
//

import Foundation

//싱글톤 타입 클래스 만들어주기

class UserInformation  {
    // shared라는 이름의 타입 프로퍼티로 인스턴스(UserInformation)를 생성해주었기 때문에
    // 이제 shared를 호출하면 같은 인스턴스가 호출된다.
    static let shared: UserInformation = UserInformation()
    
    var name: String?
    var age: String?
}
