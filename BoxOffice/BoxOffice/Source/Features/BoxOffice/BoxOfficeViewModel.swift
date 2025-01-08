//
//  BoxOfficeViewModel.swift
//  BoxOffice
//
//  Created by 최안용 on 1/5/25.
//

import Foundation

@MainActor
final class BoxOfficeViewModel: ObservableObject {
    @Published var boxOffice: [DetailBoxOffice] = []
    @Published var movie: MovieInfo?
    @Published var date: String = "" {
        didSet {
            Task {
                try await fetchBoxOffice()
            }
        }
    }
    
    init() {
        currentDate()
    }
}

//MARK: - Functions

extension BoxOfficeViewModel {
    private func currentDate() {
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        self.date = df.string(from: date)
    }
    
    private func fetchBoxOffice() async throws {
        let date: String = date.split(separator: "-").map { String($0) }.joined()
        self.boxOffice = try await BoxOfficeService.shared.fetchBoxOffice(date: date).boxOfficeResult.dailyBoxOfficeList
    }
    
    func calulateDate(_ plus: Int) {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        guard let currentDate = df.date(from: date) else { return }
        
        let resultDate = Calendar.current.date(byAdding: .day, value: plus, to: currentDate)
        self.date = df.string(from: resultDate ?? Date())
    }
    
    func fetchMovieInfo(_ movieId: String) async throws {
        self.movie = try await BoxOfficeService.shared.fetchMovieDetail(movieId: movieId).movieInfoResult.movieInfo
    }
}
