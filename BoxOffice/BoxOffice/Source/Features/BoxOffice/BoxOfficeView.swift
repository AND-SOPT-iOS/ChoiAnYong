//
//  BoxOfficeView.swift
//  BoxOffice
//
//  Created by 최안용 on 1/5/25.
//

import SwiftUI

struct BoxOfficeView: View {
    @StateObject var store: BoxOfficeStore
    @EnvironmentObject private var navigationStore: NavigationStore
    
    var body: some View {
        NavigationStack(path: $navigationStore.path) {
            ScrollView(showsIndicators: false) {
                TitleView(store: store)
                BoxOfficeListView(store: store)
            }
            .navigationDestination(for: ViewType.self) { view in
                navigationStore.bulid(view)
                    .environmentObject(store)
            }
        }
        .onAppear {
            store.dispatch(.onAppear)
        }
    }
}

//MARK: - TitleView

private struct TitleView: View {
    @ObservedObject private var store: BoxOfficeStore
    
    fileprivate init(store: BoxOfficeStore) {
        self.store = store
    }
    
    fileprivate var body: some View {
        VStack {
            Text("일별 박스오피스")
                .font(.title3.bold())
                .padding(.vertical, 20)
            
            HStack {
                Button {
                    store.dispatch(.changeDate(plus: -1))
                } label: {
                    Image(systemName: "control")
                        .rotationEffect(Angle(degrees: -90))
                }
                
                Text("\(store.state.date)")
                    .font(.headline)
                
                Button {
                    store.dispatch(.changeDate(plus: 1))
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
    @ObservedObject private var store: BoxOfficeStore
    @EnvironmentObject private var navigationStore: NavigationStore
    
    fileprivate init(store: BoxOfficeStore) {
        self.store = store
    }
    
    fileprivate var body: some View {
        Group {
            if store.state.boxOffice.isEmpty {
                Text("집계되지 않은 날짜입니다!")
                    .font(.headline)
                    .padding(.top, 300)
            } else {
                ForEach(store.state.boxOffice, id: \.self) { boxOffice in
                    BoxOfficeCell(boxOffice: boxOffice)
                        .onTapGesture {
                            navigationStore.dispatch(.push(.movieDetail(boxOffice.movieCd)))
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
    BoxOfficeView(store: BoxOfficeStore())
}
