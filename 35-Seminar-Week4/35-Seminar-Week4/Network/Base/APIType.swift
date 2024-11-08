//
//  Path.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/2/24.
//

import Foundation
import Alamofire

enum APIType {
    case singnup
    case login
    case hobby
    case otherHobby(id: Int)
    case updateInfo
    
    var path : String {
        switch self {
        case .singnup: return "/user"
        case .login: return "/login"
        case .hobby: return "/user/my-hobby"
        case .otherHobby(let id): return "/user" + "/\(id)" + "/hobby"
        case .updateInfo: return "/user"
        }
    }
    
    var mehtod: HTTPMethod {
        switch self {
        case .singnup: return .post
        case .login: return .post
        case .hobby: return .get
        case .otherHobby: return .get
        case .updateInfo: return .put
        }
    }
    
    var isHeader: Bool {
        switch self {
        case .hobby, .otherHobby, .updateInfo: return true
        default: return false
        }
    }
    
    var isRequestBody: Bool {
        switch self {
        case .hobby, .otherHobby: return false
        default: return true
        }
    }
}
