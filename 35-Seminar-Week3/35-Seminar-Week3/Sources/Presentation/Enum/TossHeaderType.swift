//
//  TossHeaderType.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 11/1/24.
//

import Foundation

enum TossHeaderType: String {
    case newNews
    case preview
    case review
    
    var title: String {
        switch self {
        case .newNews: return "새로운 소식"
        case .preview: return "미리 보기"
        case .review: return "평가 및 리뷰"
        }
    }
}
