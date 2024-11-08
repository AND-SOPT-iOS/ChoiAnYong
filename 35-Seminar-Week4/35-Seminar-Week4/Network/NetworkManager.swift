//
//  UserService.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/2/24.
//

import Foundation

import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private let session: Session
    
    init() {
        let eventLogger = NetworkEventLogger()
        session = Session(eventMonitors: [eventLogger])
    }
    
    func request<T: Codable, R: Codable>(
        request: T,
        response: R.Type,
        apiType: APIType,
        completion: @escaping (Result<R, NetworkError>) -> Void
    ) {
                
        let url = Environment.baseURL + apiType.path
        
        let parameters = apiType.isRequestBody ? request : nil
        
        let interceptor: RequestInterceptor? = apiType.isHeader ? AuthInterceptor.shared : nil

        session.request(
            url,
            method: apiType.mehtod,
            parameters: parameters,
            encoder: JSONParameterEncoder.default,
            interceptor: interceptor
        )
        .validate()
        .response { [weak self] response in
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                guard let decodedResponse = try? JSONDecoder().decode(R.self, from: data) else {
                    return completion(.failure(.decodingError))
                }
                completion(.success(decodedResponse))
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    func handleStatusCode(
        _ statusCode: Int,
        data: Data
    ) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "00"):
            return .invalidRequest
        case (400, "01"):
            return .expressionError
        case (404, ""):
            return .invalidURL
        case (409, "00"):
            return .duplicateError
        case (500, ""):
            return .serverError
        default:
            return .unknownError
        }
    }
    
    func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(
            ErrorResponse.self,
            from: data
        ) else { return "" }
        return errorResponse.code
    }
}
