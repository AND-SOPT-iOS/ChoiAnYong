//
//  App.swift
//  Seminar-3
//
//  Created by 최안용 on 10/26/24.
//

import Foundation
import UIKit

struct AppInfo {
    let iconImage: UIImage
    let ranking: Int
    let title: String
    let subtitle: String
    var downloadState: DownloadState
}

extension AppInfo {
    static let sampleApps: [AppInfo] = [
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 1,
            title: "실손24",
            subtitle: "간편한 실손보험 청구",
            downloadState: .installed
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 2,
            title: "네이버페이",
            subtitle: "지갑 없이 매장에서 결제",
            downloadState: .update
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 3,
            title: "카카오페이",
            subtitle: "마음 놓고 금융하다",
            downloadState: .installed
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 4,
            title: "현대백화점",
            subtitle: "금융",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 5,
            title: "카카오뱅크",
            subtitle: "이미 모두의 은행",
            downloadState: .reDownload
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 6,
            title: "토스",
            subtitle: "금융이 쉬워진다",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 7,
            title: "KB Pay",
            subtitle: "모든 금융을 한번에, 한손에, 한눈에 담다",
            downloadState: .update
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 8,
            title: "모바일티머니",
            subtitle: "금융",
            downloadState: .installed
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 9,
            title: "monimo(모니모, 삼성금융네트웍스)",
            subtitle: "모이는 금융, 커지는 혜택! monimo 모니모",
            downloadState: .reDownload
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 10,
            title: "한투-한국투자증권,MTS,투자,증권,해외주식,주식",
            subtitle: "한국투자:배당,공모주,펀드,연금,청약",
            downloadState: .installed
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 11,
            title: "PASS by SKT",
            subtitle: "인증을 넘어 일상으로 PASS",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 12,
            title: "현대카드",
            subtitle: "금융",
            downloadState: .update
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 13,
            title: "트래블월렛 - travel Pay",
            subtitle: "페이에 세계를 담다",
            downloadState: .reDownload
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 14,
            title: "KB스타뱅킹",
            subtitle: "모바일신분증, 결제, 통신도 다 되는 은행",
            downloadState: .installed
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 15,
            title: "케이뱅크 (Kbank)",
            subtitle: "make money",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 16,
            title: "V3 Mobile Plus",
            subtitle: "코스콤 통합인증 / 알림장 메시지 서비스",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 17,
            title: "신한 SOL뱅크 - 신한은행 스마트폰뱅킹",
            subtitle: "금융",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 18,
            title: "신한 SOL페이 - 신한카드 대표플랫폼",
            subtitle: "결제부터 자산관리, 다양한 금융상품",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 19,
            title: "하나은행, 하나원큐는 돈기운 가득한 은행 앱",
            subtitle: "송금, 해외송금, 유학생송금, 은행, Korea",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .toss),
            ranking: 20,
            title: "내 곁에 국민연금",
            subtitle: "국민연금공단 내 곁에 국민연금 대국민 서비스 앱",
            downloadState: .download
        )
    ]
}
