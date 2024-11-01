//
//  TossPageSection.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 11/1/24.
//

import Foundation

enum TossPageSection {
    case appHeader
    case appInfo
    case appVersion
    case preview([PreviewInfo])
    case deviceType
    case appDescription
    case review
    case detailReview([ReviewInfo])
    case evaluation
}
