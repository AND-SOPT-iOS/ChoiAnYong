//
//  BoxOfficeService.swift
//  BoxOffice
//
//  Created by 최안용 on 1/5/25.
//

import Foundation

import Moya

final class BoxOfficeService {
    static let shared = BoxOfficeService()
    
    private let provider = MoyaProvider<BoxOfficeAPI>(plugins: [MoyaLoggingPlugin()])
    
    func fetchBoxOffice(date: String) async throws -> BoxOfficeResponse {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.boxOffice(date: date)) { result in
                switch result {
                case .success(let response):
                    guard let boxOffice = try? response.map(BoxOfficeResponse.self) else {
                        return continuation.resume(throwing: MoyaError.jsonMapping(response))
                    }
                    continuation.resume(returning: boxOffice)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func fetchMovieDetail(movieId: String) async throws -> MovieResponse {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.movieDetailInfo(code: movieId)) { result in
                switch result {
                case .success(let response):
                    guard let movie = try? response.map(MovieResponse.self) else {
                        return continuation.resume(throwing: MoyaError.jsonMapping(response))
                    }
                    continuation.resume(returning: movie)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
