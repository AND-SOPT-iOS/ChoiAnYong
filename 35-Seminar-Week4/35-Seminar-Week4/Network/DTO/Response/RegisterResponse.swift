//
//  RegisterResponse.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/4/24.
//

import Foundation

struct RegisterResponse: Codable {
    let result: Number
}

struct Number: Codable {
    let no: Int
}
