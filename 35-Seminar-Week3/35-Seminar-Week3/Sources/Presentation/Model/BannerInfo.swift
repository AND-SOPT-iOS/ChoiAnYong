//
//  BannerInfo.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 10/29/24.
//

import Foundation
import UIKit

struct BannerInfo {
    let category: String
    let title: String
    let subtitle: String
    let bannerImage: UIImage
    let iconImage: UIImage
    let bottomTitle: String
    let bottomSubtitle: String
    var downloadState: DownloadState
}

extension BannerInfo {
    static let sampleBanners: [BannerInfo] = [
        .init(
            category: "새로운 경험",
            title: "Fortune City - A Finance App",
            subtitle: "게임을 하듯 관리하는 가계부",
            bannerImage: UIImage(resource: .fotuneCityBanner),
            iconImage: UIImage(resource: .fortune),
            bottomTitle: "Fortune City - A Finance App",
            bottomSubtitle: "좋은 소비습관을 만들어 보에요!",
            downloadState: .downloaded
        ),
        .init(
            category: "추천",
            title: "Taxnote 부기 및 회계 앱",
            subtitle: "간편한 장부 관리",
            bannerImage: UIImage(resource: .taxnoteBanner),
            iconImage: UIImage(resource: .taxnote),
            bottomTitle: "Taxnote 부기 및 회계 앱",
            bottomSubtitle: "자영업자용 세금 환급을 위한 부기 및 회계 앱",
            downloadState: .reDownload
        ),
        .init(
            category: "추천",
            title: "Currenzy",
            subtitle: "빠르고 쉬운 환율 계산",
            bannerImage: UIImage(resource: .currenzyBanner),
            iconImage: UIImage(resource: .currenzy),
            bottomTitle: "Currenzy",
            bottomSubtitle: "금융",
            downloadState: .cost(cost: 6600)
        ),
        .init(
            category: "새로운 앱",
            title: "Elk - 여행 환율 변환기",
            subtitle: "언제 어디서나 간편한 환율 체크",
            bannerImage: UIImage(resource: .elkBanner),
            iconImage: UIImage(resource: .elk),
            bottomTitle: "Elk - 여행 환율 변환기",
            bottomSubtitle: "Winner of ADA 2017",
            downloadState: .download
        )
    ]
}

