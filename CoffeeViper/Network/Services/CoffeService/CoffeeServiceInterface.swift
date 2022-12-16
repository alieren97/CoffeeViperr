//
//  CoffeeServiceInterface.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 15.12.2022.
//

import Foundation

protocol CoffeeServiceInterface: AnyObject {
    func getCoffees(coffeeType: CoffeeType, completion: @escaping (Result<[CoffeeResponse], Error>) -> Void)
}
