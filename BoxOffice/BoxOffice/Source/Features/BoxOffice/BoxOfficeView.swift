//
//  BoxOfficeView.swift
//  BoxOffice
//
//  Created by 최안용 on 1/5/25.
//

import SwiftUI

struct BoxOfficeView: View {
    @StateObject var viewModel: BoxOfficeViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                TitleView(viewModel: viewModel)
                BoxOfficeListView(viewModel: viewModel)
            }
            .navigationDestination(item: $viewModel.movie) { movie in
                MovieDetailView(movie: movie)
            }
        }
    }
}

//MARK: - TitleView

private struct TitleView: View {
    @ObservedObject private var viewModel: BoxOfficeViewModel
    
    fileprivate init(viewModel: BoxOfficeViewModel) {
        self.viewModel = viewModel
    }
    
    fileprivate var body: some View {
        VStack {
            Text("일별 박스오피스")
                .font(.title3.bold())
                .padding(.vertical, 20)
            
            HStack {
                Button {
                    viewModel.calulateDate(-1)
                } label: {
                    Image(systemName: "control")
                        .rotationEffect(Angle(degrees: -90))
                }
                
                Text("\(viewModel.date)")
                    .font(.headline)
                
                Button {
                    viewModel.calulateDate(1)
                } label: {
                    Image(systemName: "control")
                        .rotationEffect(Angle(degrees: 90))
                }
            }
        }
        .padding(.bottom, 20)
    }
}

//MARK: - BoxOfficeListView

private struct BoxOfficeListView: View {
    @ObservedObject private var viewModel: BoxOfficeViewModel
    
    fileprivate init(viewModel: BoxOfficeViewModel) {
        self.viewModel = viewModel
    }
    
    fileprivate var body: some View {
        Group {
            if viewModel.boxOffice.isEmpty {
                Text("집계되지 않은 날짜입니다!")
                    .font(.headline)
                    .padding(.top, 300)
            } else {
                ForEach(viewModel.boxOffice, id: \.self) { boxOffice in
                    BoxOfficeCell(boxOffice: boxOffice)
                        .onTapGesture {
                            Task {
                                try await viewModel.fetchMovieInfo(boxOffice.movieCd)
                            }
                        }
                }
            }
        }
        .padding(.horizontal, 10)
        
    }
}

//MARK: - BoxOfficeCell

private struct BoxOfficeCell:View {
    let boxOffice: DetailBoxOffice
    
    fileprivate init(boxOffice: DetailBoxOffice) {
        self.boxOffice = boxOffice
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("#\(boxOffice.rank)")
                .font(.title2.bold())
                .foregroundStyle(.blue)
            
            
            Text("\(boxOffice.movieNm)")
                .font(.subheadline.bold())
            
            Text("관객 수: \(boxOffice.audiAcc)")
                .font(.caption)
                .foregroundStyle(.gray)
            
            Text("개봉일: \(boxOffice.openDt)")
                .font(.caption2)
                .foregroundStyle(.gray)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 1)
        }
    }
}

#Preview {
    BoxOfficeView(viewModel: BoxOfficeViewModel())
}
