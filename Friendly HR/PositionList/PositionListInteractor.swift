//
//  PositionListInteractor.swift
//  Friendly HR
//
//  Created by Антон Пеньков on 28.03.2024.
//

import Foundation

protocol PositionListBusinessLogic {
    func fetchPositions()
}

protocol PositionListDataStore {
    var positions: [Position] { get }
}

class PositionListInteractor: PositionListBusinessLogic, PositionListDataStore {
    
    var presenter: PositionListPresentationLogic?
    var positions: [Position] = []
    
    func fetchPositions() {
        NetworkManager.shared.fetchData { [weak self] positions in
            self?.positions = positions
            let response = PositionList.ShowPositions.Response(positions: positions)
            self?.presenter?.presentPositions(response: response)
        }
    }
    
    
    
}
