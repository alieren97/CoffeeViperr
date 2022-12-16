//
//  CoffeeService.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 15.12.2022.
//

import Foundation
import Alamofire

class CoffeeService: CoffeeServiceInterface {
    static let shared = CoffeeService()
    private let baseURL = "https://api.sampleapis.com/coffee"

    func getCoffees(coffeeType: CoffeeType, completion: @escaping (Result<[CoffeeResponse], Error>) -> Void) {
        let customURL = "\(baseURL)/\(coffeeType)"
        APIManager.shared.request(dataType: [CoffeeResponse].self, urlString: customURL, method: .get) { result in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
