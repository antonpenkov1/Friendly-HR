//
//  PositionListRouter.swift
//  Friendly HR
//
//  Created by Антон Пеньков on 28.03.2024.
//

import UIKit

@objc protocol PositionListRoutingLogic {
    func routeToPositionDetails()
}

protocol PositionListDataPassing {
    var dataStore: PositionListDataStore? { get }
}

class PositionListRouter: NSObject, PositionListRoutingLogic, PositionListDataPassing {
    
    weak var viewController: PositionListViewController?
    var dataStore: PositionListDataStore?
    
    func routeToPositionDetails() {
        
    }
    
    // MARK: - Navigation
    func navigateToPositionDetails(source: PositionListViewController, destination: PositionDetailsViewController) {
        source.show(destination, sender: nil)
    }
    
    // MARK: - Passing data
    func passDataToPositionDetails(source: PositionListDataStore, destination: inout PositionDetailsDataStore) {
        guard let indexPath = viewController?.tableView.indexPathForSelectedRow else { return }
        destination.position = source.positions[indexPath.row]
    }
}
