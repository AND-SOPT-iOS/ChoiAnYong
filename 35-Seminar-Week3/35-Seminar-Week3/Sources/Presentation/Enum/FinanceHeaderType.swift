//
//  HeaderType.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 10/31/24.
//

import Foundation

enum FinanceHeaderType: String {
    case required
    case charged
    case free
    
    var title: String {
        switch self {
        case .required: return "필수 금융 앱"
        case .charged: return "유료 순위"
        case .free: return "무료 순위"
        }
    }
}
