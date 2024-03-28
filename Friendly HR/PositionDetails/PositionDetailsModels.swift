//
//  PositionDetailsModels.swift
//  Friendly HR
//
//  Created by Антон Пеньков on 28.03.2024.
//

import Foundation

typealias PositionDetailsResponse = PositionDetails.ShowDetails.Response
typealias PositionDetailsViewModel = PositionDetails.ShowDetails.ViewModel

enum PositionDetails {
    
    // MARK: - Use cases
    enum ShowDetails {
        struct Response {
            let positionName: String?
            let imageData: Data?
            let payRate: String?
            let technologyStack: String?
            let positionDescription: String?
            let companyDescription: String?
        }
        
        struct ViewModel {
            let positionName: String
            let imageData: Data
            let payRate: String
            let technologyStack: String
            let positionDescription: String
            let companyDescription: String
        }
    }
}
