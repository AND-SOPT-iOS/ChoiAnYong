//
//  PreviewInfo.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 11/1/24.
//

import Foundation
import UIKit

struct PreviewInfo {
    let image: UIImage
}

extension PreviewInfo {
    static let previewInfos: [PreviewInfo] = [
        .init(image: UIImage(resource: .tossPreview)),
        .init(image: UIImage(resource: .tossPreview)),
        .init(image: UIImage(resource: .tossPreview)),
        .init(image: UIImage(resource: .tossPreview)),
        .init(image: UIImage(resource: .tossPreview))
    ]
}
