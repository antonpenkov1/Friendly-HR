//
//  PositionListPresenter.swift
//  Friendly HR
//
//  Created by Антон Пеньков on 28.03.2024.
//

import Foundation

protocol PositionListPresentationLogic {
    func presentPositions(response: PositionList.ShowPositions.Response)
}

class PositionListPresenter: PositionListPresentationLogic {
    
    weak var viewController: PositionListDisplayLogic?
    
    func presentPositions(response: PositionList.ShowPositions.Response) {
        let rows: [PositionCellViewModelProtocol] = response.positions.map {
            PositionCellViewModel(position: $0)
        }
        let viewModel = PositionList.ShowPositions.ViewModel(rows: rows)
        viewController?.displayPositions(viewModel: viewModel)
    }
}
