//
//  loginResponse.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/2/24.
//

import Foundation

struct LoginResponse: Codable {
    let result: Token
}

struct Token: Codable {
    let token: String
}
