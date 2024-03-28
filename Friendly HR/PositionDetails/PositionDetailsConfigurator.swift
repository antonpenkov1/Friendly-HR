//
//  PositionDetailsConfigurator.swift
//  Friendly HR
//
//  Created by Антон Пеньков on 28.03.2024.
//

import Foundation

final class PositionDetailsConfigurator {
    static let shared = PositionDetailsConfigurator()
    
    private init() {}
    
    func configure(with viewController: PositionDetailsViewController) {
        let interactor = PositionDetailsInteractor()
        let presenter = PositionDetailsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}
