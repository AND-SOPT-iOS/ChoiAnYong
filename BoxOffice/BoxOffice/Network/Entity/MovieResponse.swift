//
//  MovieResponse.swift
//  BoxOffice
//
//  Created by 최안용 on 1/5/25.
//

import Foundation

struct MovieResponse: Decodable {
    let movieInfoResult: MovieInfoResult
}

struct MovieInfoResult: Decodable {
    let movieInfo: MovieInfo
}

struct MovieInfo: Decodable, Hashable {
    let movieNm: String
    let showTm: String
    let openDt: String
    let typeNm: String
    let nations: [NationNm]
    let genres: [GenreNm]
}

struct NationNm: Decodable, Hashable {
    let nationNm: String
}

struct GenreNm: Decodable, Hashable {
    let genreNm: String
}
