//
//  BoxOfficeStore.swift
//  BoxOffice
//
//  Created by 최안용 on 1/5/25.
//

import Foundation

final class BoxOfficeStore: ObservableObject {
    @Published private(set) var state: BoxOfficeState
    
    private let boxOfficeService: BoxOfficeService
    
    init(
        state: BoxOfficeState = BoxOfficeState(),
        boxOfficeService: BoxOfficeService = BoxOfficeService()
    ) {
        self.state = state
        self.boxOfficeService = boxOfficeService
    }
    
    func dispatch(_ intent: BoxOfficeIntent) {
        switch intent {
        case .onAppear:
            Task {
                do {
                    await currentDate()
                    try await fetchBoxOffice()
                } catch {
                    print(error)
                }
            }
        case .changeDate(let plus):
            Task {
                do {
                    await calulateDate(plus)
                    try await fetchBoxOffice()
                } catch {
                    print(error)
                }
            }
        case .fetchBoxOffice:
            Task {
                do {
                    try await fetchBoxOffice()
                } catch {
                    print(error)
                }
            }
        case .fetchMovieInfo(let movieId):
            Task {
                do {
                    try await fetchMovieInfo(movieId)
                } catch {
                    print(error)
                }
            }
        }
    }
}

//MARK: - Functions

extension BoxOfficeStore {
    @MainActor
    private func currentDate() {        
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        state.date = df.string(from: date)
    }
    
    @MainActor
    private func fetchBoxOffice() async throws {
        let date: String = state.date.split(separator: "-").map { String($0) }.joined()
        state.boxOffice = try await boxOfficeService.fetchBoxOffice(date: date).boxOfficeResult.dailyBoxOfficeList
    }
    
    @MainActor
    private func calulateDate(_ plus: Int) {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        guard let currentDate = df.date(from: state.date) else { return }
        
        let resultDate = Calendar.current.date(byAdding: .day, value: plus, to: currentDate)
        state.date = df.string(from: resultDate ?? Date())
    }
    
    @MainActor
    private func fetchMovieInfo(_ movieId: String) async throws {
        state.movie = try await boxOfficeService.fetchMovieDetail(movieId: movieId).movieInfoResult.movieInfo
    }
}
