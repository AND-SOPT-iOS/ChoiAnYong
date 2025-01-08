//
//  BoxOfficeResponse.swift
//  BoxOffice
//
//  Created by 최안용 on 1/5/25.
//

import Foundation

struct BoxOfficeResponse: Decodable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Decodable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [DetailBoxOffice]
}

struct DetailBoxOffice: Decodable, Hashable {
    let rank: String
    let movieNm: String
    let openDt: String
    let audiAcc: String
    let movieCd: String
}


extension DetailBoxOffice {
    static func example() -> [DetailBoxOffice] {
        return [
            .init(rank: "1", movieNm: "하얼빈", openDt: "2025-01-02", audiAcc: "340499", movieCd: "20228796")
        ]
    }
}
