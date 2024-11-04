//
//  RegisterRequest.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/2/24.
//

import Foundation

struct RegisterRequest: Codable {
    let username: String
    let password: String
    let hobby: String
}
