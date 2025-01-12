//
//  BoxOfficeDomain.swift
//  BoxOffice
//
//  Created by 최안용 on 1/8/25.
//

import Foundation

struct BoxOfficeState {
    var boxOffice: [DetailBoxOffice] = []
    var movie: MovieInfo? = nil
    var date: String = ""
}


enum BoxOfficeIntent {
    case onAppear
    case changeDate(plus: Int)
    case fetchBoxOffice
    case fetchMovieInfo(movieId: String)
}
