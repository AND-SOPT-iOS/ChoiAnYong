//
//  DownloadState.swift
//  Seminar-3
//
//  Created by 최안용 on 10/26/24.
//

import Foundation

enum DownloadState: String {
    case installed = "열기"
    case download = "받기"
    case reDownload = "다시받기"
    case update = "업데이트"
}
