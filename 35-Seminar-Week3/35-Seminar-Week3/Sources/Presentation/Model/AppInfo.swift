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
    var ranking: Int?
    let title: String
    let subtitle: String
    var downloadState: DownloadState
}

extension AppInfo {
    static let freeApps: [AppInfo] = [
        AppInfo(
            iconImage: UIImage(resource: .silson24),
            ranking: 1,
            title: "실손24",
            subtitle: "간편한 실손보험 청구",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .naverpay),
            ranking: 2,
            title: "네이버페이",
            subtitle: "지갑 없이 매장에서 결제",
            downloadState: .update
        ),
        AppInfo(
            iconImage: UIImage(resource: .kakaopay),
            ranking: 3,
            title: "카카오페이",
            subtitle: "마음 놓고 금융하다",
            downloadState: .downloaded
        ),
        AppInfo(
            iconImage: UIImage(resource: .hyundaidepartment),
            ranking: 4,
            title: "현대백화점",
            subtitle: "금융",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .kakaobank),
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
            iconImage: UIImage(resource: .kbpay),
            ranking: 7,
            title: "KB Pay",
            subtitle: "모든 금융을 한번에, 한손에, 한눈에 담다",
            downloadState: .update
        ),
        AppInfo(
            iconImage: UIImage(resource: .mobileTmoney),
            ranking: 8,
            title: "모바일티머니",
            subtitle: "금융",
            downloadState: .downloaded
        ),
        AppInfo(
            iconImage: UIImage(resource: .monimo),
            ranking: 9,
            title: "monimo(모니모, 삼성금융네트웍스)",
            subtitle: "모이는 금융, 커지는 혜택! monimo 모니모",
            downloadState: .reDownload
        ),
        AppInfo(
            iconImage: UIImage(resource: .hanto),
            ranking: 10,
            title: "한투-한국투자증권,MTS,투자,증권,해외주식,주식",
            subtitle: "한국투자:배당,공모주,펀드,연금,청약",
            downloadState: .downloaded
        ),
        AppInfo(
            iconImage: UIImage(resource: .pass),
            ranking: 11,
            title: "PASS by SKT",
            subtitle: "인증을 넘어 일상으로 PASS",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .hyundaicard),
            ranking: 12,
            title: "현대카드",
            subtitle: "금융",
            downloadState: .update
        ),
        AppInfo(
            iconImage: UIImage(resource: .travel),
            ranking: 13,
            title: "트래블월렛 - travel Pay",
            subtitle: "페이에 세계를 담다",
            downloadState: .reDownload
        ),
        AppInfo(
            iconImage: UIImage(resource: .kbstar),
            ranking: 14,
            title: "KB스타뱅킹",
            subtitle: "모바일신분증, 결제, 통신도 다 되는 은행",
            downloadState: .downloaded
        ),
        AppInfo(
            iconImage: UIImage(resource: .kbank),
            ranking: 15,
            title: "케이뱅크 (Kbank)",
            subtitle: "make money",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .v3),
            ranking: 16,
            title: "V3 Mobile Plus",
            subtitle: "코스콤 통합인증 / 알림장 메시지 서비스",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .shinhanbank),
            ranking: 17,
            title: "신한 SOL뱅크 - 신한은행 스마트폰뱅킹",
            subtitle: "금융",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .shinhanpay),
            ranking: 18,
            title: "신한 SOL페이 - 신한카드 대표플랫폼",
            subtitle: "결제부터 자산관리, 다양한 금융상품",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .onequeue),
            ranking: 19,
            title: "하나은행, 하나원큐는 돈기운 가득한 은행 앱",
            subtitle: "송금, 해외송금, 유학생송금, 은행, Korea",
            downloadState: .download
        ),
        AppInfo(
            iconImage: UIImage(resource: .nps),
            ranking: 20,
            title: "내 곁에 국민연금",
            subtitle: "국민연금공단 내 곁에 국민연금 대국민 서비스 앱",
            downloadState: .download
        )
    ]
    
    static let requiredApps: [AppInfo] = [
        .init(iconImage: .fin,
              title: "Fin - 가계부 및 예산 추적기",
              subtitle: "당신의 돈은 어디로 가고 있을까요?",
              downloadState: .downloaded),
        .init(iconImage: .splitwise,
              title: "Splitwise",
              subtitle: "금융",
              downloadState: .reDownload),
        .init(iconImage: .moneyCoach,
              title: "Money Coach Budget Manager Pro",
              subtitle: "Expense Tracker, Bill Planner",
              downloadState: .download),
        .init(iconImage: .ynab,
              title: "YNAB",
              subtitle: "금융",
              downloadState: .download),
        .init(iconImage: .ifinance,
              title: "iFinance 5",
              subtitle: "금융",
              downloadState: .download),
        .init(iconImage: .moneyStatus,
              title: "MoneyStats - Budget Planner",
              subtitle: "금융",
              downloadState: .reDownload),
        .init(iconImage: .buddy,
              title: "Buddy: Budget Planner App",
              subtitle: "금융",
              downloadState: .download),
        .init(iconImage: .moneyControl,
              title: "MoneyControl Spending Tracker",
              subtitle: "금융",
              downloadState: .downloaded),
        .init(iconImage: .pockey,
              title: "Pockey - 포켓 머니 매니저",
              subtitle: "용돈 관리 등",
              downloadState: .download)
    ]
    
    static let chargedApps: [AppInfo] = [
        AppInfo(
            iconImage: UIImage(resource: .weple),
            ranking: 1,
            title: "위플 가계부 Pro",
            subtitle: "아이폰 사용자 수 1위 가계부",
            downloadState: .cost(cost: 14000)
        ),
        AppInfo(
            iconImage: UIImage(resource: .moneyManaer),
            ranking: 2,
            title: "편한가계부 (광고제거)",
            subtitle: "국내 1위 가계부",
            downloadState: .cost(cost: 8800)
        ),
        AppInfo(
            iconImage: UIImage(resource: .membership),
            ranking: 3,
            title: "멤버십 위젯 Pro",
            subtitle: "멤버십, 쿠폰, 포인트를 한번에 빠르게 할인/적립 받기",
            downloadState: .cost(cost: 4400)
        ),
        AppInfo(
            iconImage: UIImage(resource: .card),
            ranking: 4,
            title: "보안카드 위젯",
            subtitle: "초스피드 계좌이체",
            downloadState: .cost(cost: 3300)
        ),
        AppInfo(
            iconImage: UIImage(resource: .usDebt),
            ranking: 5,
            title: "US Debt Clock .org",
            subtitle: "금융",
            downloadState: .cost(cost: 6600)
        ),
        AppInfo(
            iconImage: UIImage(resource: .costit),
            ranking: 6,
            title: "코스트잇",
            subtitle: "알뜰살뜰 소비 메모장",
            downloadState: .cost(cost: 1100)
        ),
        AppInfo(
            iconImage: UIImage(resource: .binance),
            ranking: 7,
            title: "BA || Plus Fianacial Calc",
            subtitle: "금융",
            downloadState: .cost(cost: 22000)
        ),
        AppInfo(
            iconImage: UIImage(resource: .moneyManagerclassic),
            ranking: 8,
            title: "편한가계부 Classic (+ PC 가계부)",
            subtitle: "금융",
            downloadState: .cost(cost: 8800)
        ),
        AppInfo(
            iconImage: UIImage(resource: .elk),
            ranking: 9,
            title: "Pennies - 예산 및 재무 관리 프로그램",
            subtitle: "금융",
            downloadState: .cost(cost: 6600)
        )
    ]
}
