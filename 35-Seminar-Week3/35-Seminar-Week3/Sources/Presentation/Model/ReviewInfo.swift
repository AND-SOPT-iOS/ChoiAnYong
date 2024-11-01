//
//  ReviewInfo.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 11/1/24.
//

import Foundation

struct ReviewInfo {
    let title: String
    let rating: String
    let info: String
    let reviewText: String
    let developerAnswer: String
    let answerDate: String
    let developerAnswerText: String
}

extension ReviewInfo {
    static let reviews: [ReviewInfo] = [
        .init(
            title: "최안용",
            rating: "★★★★★",
            info: "10월 25일 • ISFP",
            reviewText: "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한 사람 대한으로 길이 보전하세",
            developerAnswer: "개발자 대답",
            answerDate: "10월 26일",
            developerAnswerText: "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 개선하였습니다."
        ),
        .init(
            title: "최안용",
            rating: "★★★★★",
            info: "10월 25일 • ISFP",
            reviewText: "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한 사람 대한으로 길이 보전하세",
            developerAnswer: "개발자 대답",
            answerDate: "10월 26일",
            developerAnswerText: "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 개선하였습니다."
        ),
        .init(
            title: "최안용",
            rating: "★★★★★",
            info: "10월 25일 • ISFP",
            reviewText: "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한 사람 대한으로 길이 보전하세",
            developerAnswer: "개발자 대답",
            answerDate: "10월 26일",
            developerAnswerText: "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 개선하였습니다."
        ),
        .init(
            title: "최안용",
            rating: "★★★★★",
            info: "10월 25일 • ISFP",
            reviewText: "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한 사람 대한으로 길이 보전하세",
            developerAnswer: "개발자 대답",
            answerDate: "10월 26일",
            developerAnswerText: "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 개선하였습니다."
        ),
        .init(
            title: "최안용",
            rating: "★★★★★",
            info: "10월 25일 • ISFP",
            reviewText: "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한 사람 대한으로 길이 보전하세",
            developerAnswer: "개발자 대답",
            answerDate: "10월 26일",
            developerAnswerText: "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 개선하였습니다."
        )
    ]
}
