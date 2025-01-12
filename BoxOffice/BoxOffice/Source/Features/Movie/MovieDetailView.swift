//
//  MovieDetailView.swift
//  BoxOffice
//
//  Created by 최안용 on 1/5/25.
//

import SwiftUI

struct MovieDetailView: View {
    @EnvironmentObject private var store: BoxOfficeStore
    let movieId: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(store.state.movie?.movieNm ?? "")")
            Text("상영 시간: \(store.state.movie?.showTm ?? "")")
            Text("개봉일: \(store.state.movie?.openDt ?? "")")
            Text("영화 유형: \(store.state.movie?.typeNm ?? "")")
            Text("제작 국가: \(store.state.movie?.nations.first?.nationNm ?? "오류")")
            Text("장르: \(store.state.movie?.genres.first?.genreNm ?? "오류")")
        }
        .onAppear {
            store.dispatch(.fetchMovieInfo(movieId: movieId))
        }
    }
}

#Preview {
    MovieDetailView(movieId: "kd")
}
