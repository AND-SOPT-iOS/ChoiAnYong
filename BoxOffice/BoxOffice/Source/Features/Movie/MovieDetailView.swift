//
//  MovieDetailView.swift
//  BoxOffice
//
//  Created by 최안용 on 1/5/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: MovieInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(movie.movieNm)")
            Text("상영 시간: \(movie.showTm)")
            Text("개봉일: \(movie.openDt)")
            Text("영화 유형: \(movie.typeNm)")
            Text("제작 국가: \(movie.nations.first?.nationNm ?? "오류")")
            Text("장르: \(movie.genres.first?.genreNm ?? "오류")")
        }
    }
}

#Preview {
    MovieDetailView(movie: .init(movieNm: "dk", showTm: "dlkjf", openDt: "djfowing", typeNm: "dklsjf", nations: [], genres: []))
}
