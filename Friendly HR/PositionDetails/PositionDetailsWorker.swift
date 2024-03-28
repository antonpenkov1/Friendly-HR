//
//  PositionDetailsWorker.swift
//  Friendly HR
//
//  Created by Антон Пеньков on 28.03.2024.
//

import Foundation

class PositionDetailsWorker {
    func getImage(from imageURL: URL?) -> Data? {
        ImageManager.shared.fetchImageData(from: imageURL)
    }
}
