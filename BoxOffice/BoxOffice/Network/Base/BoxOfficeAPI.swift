//
//  BoxOfficeAPI.swift
//  BoxOffice
//
//  Created by 최안용 on 1/5/25.
//

import Foundation

import Moya

enum BoxOfficeAPI {
    case boxOffice(date: String)
    case movieDetailInfo(code: String)
}

extension BoxOfficeAPI: TargetType {
    var headers: [String : String]? {
        return nil
    }
    
    var baseURL: URL {
        guard let url = URL(string: Environment.baseURL) else {
            fatalError("URL Error")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .boxOffice:
            return "/boxoffice/searchDailyBoxOfficeList.json"
        case .movieDetailInfo:
            return "/movie/searchMovieInfo.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .boxOffice: return .get
        case .movieDetailInfo: return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .boxOffice(let date):
            let params: [String: String] = ["key": Environment.apiKey, "targetDt": date]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .movieDetailInfo(let code):
            let params: [String: String] = ["key": Environment.apiKey, "movieCd": code]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
}
