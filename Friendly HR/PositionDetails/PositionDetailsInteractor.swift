//
//  PositionDetailsInteractor.swift
//  Friendly HR
//
//  Created by Антон Пеньков on 28.03.2024.
//

import Foundation

protocol PositionDetailsBusinessLogic {
    func providePositionDetails()
}

protocol PositionDetailsDataStore {
    var position: Position? { get set }
}

class PositionDetailsInteractor: PositionDetailsBusinessLogic, PositionDetailsDataStore {
    var position: Position?
    var presenter: PositionDetailsPresentationLogic?
    var worker: PositionDetailsWorker?
    
    func providePositionDetails() {
        worker = PositionDetailsWorker()
        let imageData = worker?.getImage(from: position?.imageUrl)
        
        let response = PositionDetailsResponse(
            positionName: position?.name,
            imageData: imageData,
            payRate: position?.payRate,
            technologyStack: position?.technologyStack,
            positionDescription: position?.companyDescription,
            companyDescription: position?.companyDescription
        )
        presenter?.presentPositionDetails(response: response)
    }
}
