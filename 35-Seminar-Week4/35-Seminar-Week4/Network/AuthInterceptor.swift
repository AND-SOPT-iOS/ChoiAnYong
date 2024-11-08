//
//  AuthInterceptor.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/4/24.
//

import Foundation

import Alamofire

final class AuthInterceptor: RequestInterceptor {
    static let shared = AuthInterceptor()
    
    func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, any Error>) -> Void
    ) {
        guard let token = KeyChainManager.shared.load(key: KeyChainManager.tokenKey) else {
            return
        }
        
        var urlRequest = urlRequest
        urlRequest.setValue(token, forHTTPHeaderField: "token")
        completion(.success(urlRequest))
    }
}
