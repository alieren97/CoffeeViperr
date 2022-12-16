//
//  APIManager.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 15.12.2022.
//

import UIKit
import Alamofire

enum HTTPMethod: String {
    case get = "GET"
}

enum CoffeeType {
    case hot
    case iced
}

class APIManager {
    static let shared = APIManager()

    func request<T: Decodable>(dataType: T.Type, urlString: String, method: HTTPMethod, completion: @escaping (Result<T, Error>) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: method.rawValue)
        AF.request(urlString, method: method).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let objectResponse = try JSONDecoder().decode(dataType, from: data)
                    completion(.success(objectResponse))
                } catch let error as Error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
