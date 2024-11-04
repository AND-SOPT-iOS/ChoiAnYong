//
//  DownloadState.swift
//  Seminar-3
//
//  Created by 최안용 on 10/26/24.
//

import Foundation
import UIKit

enum DownloadState {
    case downloaded
    case download
    case reDownload
    case update
    case cost(cost: Int)
    
    var title: String? {
        switch self {
        case .downloaded: return "열기"
        case .download: return "받기"
        case .reDownload: return nil
        case .update: return "업데이트"
        case .cost(let cost):
            return numberFormatting(number: cost)
        }
    }
    
    var image: UIImage? {
        if case .reDownload = self {
            return UIImage(systemName: "icloud.and.arrow.down")
        }
        return nil
    }
    
    private func numberFormatting(number: Int) -> String {
        let value = number
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: value) ?? "0"
        
        return "₩"+result
    }
}
