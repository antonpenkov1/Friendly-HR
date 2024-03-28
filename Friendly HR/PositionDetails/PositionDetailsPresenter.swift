//
//  PositionDetailsPresenter.swift
//  Friendly HR
//
//  Created by Антон Пеньков on 28.03.2024.
//

import Foundation

protocol PositionDetailsPresentationLogic {
    func presentPositionDetails(response: PositionDetailsResponse)
}

class PositionDetailsPresenter: PositionDetailsPresentationLogic {
    
    weak var viewController: PositionDetailsDisplayLogic?
    
    func presentPositionDetails(response: PositionDetailsResponse) {
        let viewModel = PositionDetailsViewModel(
            positionName: response.positionName ?? "",
            imageData: response.imageData ?? Data(),
            payRate: response.payRate ?? "",
            technologyStack: response.technologyStack ?? "",
            positionDescription: response.positionDescription ?? "",
            companyDescription: response.companyDescription ?? ""
        )
        viewController?.displayPositionDetails(viewModel: viewModel)
    }
}
