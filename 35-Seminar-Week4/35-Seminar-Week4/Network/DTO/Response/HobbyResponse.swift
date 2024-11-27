//
//  HobbyResponse.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/4/24.
//

import Foundation

struct HobbyResponse: Codable {
    let result: Hobby
}

struct Hobby: Codable {
    let hobby: String
}
