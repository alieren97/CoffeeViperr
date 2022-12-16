//
//  Coffee.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 15.12.2022.
//

import Foundation

struct CoffeeResponse: Decodable {
    let title: String
    let description: String
    let ingredients: [String]
    let image: String
    let id: Int
}
