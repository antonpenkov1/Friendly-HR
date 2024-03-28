//
//  PositionCell.swift
//  Friendly HR
//
//  Created by Антон Пеньков on 28.03.2024.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: PositionCellViewModelProtocol? { get }
}

class PositionCell: UITableViewCell, CellModelRepresentable {
    var viewModel: PositionCellViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel as? PositionCellViewModel else { return }
        var content = defaultContentConfiguration()
        content.text = viewModel.positionName
        if let imageData = viewModel.imageData {
            content.image = UIImage(data: imageData)
        }
        contentConfiguration = content
    }
}
