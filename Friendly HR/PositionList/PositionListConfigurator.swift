//
//  PositionListConfigurator.swift
//  Friendly HR
//
//  Created by Антон Пеньков on 28.03.2024.
//

import Foundation

final class PositionListConfigurator {
    static let shared = PositionListConfigurator()
    
    private init() {}
    
    func configure(with viewController: PositionListViewController) {
        let interactor = PositionListInteractor()
        let presenter = PositionListPresenter()
        let router = PositionListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
