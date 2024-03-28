//
//  NetworkManager.swift
//  Friendly HR
//
//  Created by Антон Пеньков on 28.03.2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let api = "https://6e6b2bb63c304c7b9337aa02f23c6c05.api.mockbin.io/"
    
    private init() {}
    
    func fetchData(completion: @escaping (_ positions: [Position]) -> Void) {
        guard let url = URL(string: api) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let positions = try decoder.decode([Position].self, from: data)
                DispatchQueue.main.async {
                    completion(positions)
                }
            } catch let error {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
}
