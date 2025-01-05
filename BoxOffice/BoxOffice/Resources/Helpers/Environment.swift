//
//  Environment.swift
//  BoxOffice
//
//  Created by 최안용 on 1/5/25.
//

import Foundation

enum Environment {
    static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as? String ?? ""
    static let apiKey: String = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
}
