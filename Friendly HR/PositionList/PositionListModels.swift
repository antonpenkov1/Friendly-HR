//
//  PositionListModels.swift
//  Friendly HR
//
//  Created by Антон Пеньков on 28.03.2024.
//

import Foundation

typealias PositionCellViewModel = PositionList.ShowPositions.ViewModel.PositionCellViewModel

protocol PositionCellViewModelProtocol {
    var identifier: String { get }
    var height: Double { get }
    var positionName: String { get }
    var imageData: Data? { get }
    init(position: Position)
}

enum PositionList {
 
    // MARK: - Use cases
    enum ShowPositions {
        
        struct Response {
            let positions: [Position]
        }
        
        struct ViewModel {
            struct PositionCellViewModel: PositionCellViewModelProtocol {
                var identifier: String {
                    "PositionCell"
                }
                
                var height: Double {
                    100
                }
                
                var positionName: String {
                    position.name
                }
                
                var imageData: Data? {
                    ImageManager.shared.fetchImageData(from: position.imageUrl)
                }
                
                private let position: Position
                
                init(position: Position) {
                    self.position = position
                }
                
                
            }
            let rows: [PositionCellViewModelProtocol]
        }
    }
}
