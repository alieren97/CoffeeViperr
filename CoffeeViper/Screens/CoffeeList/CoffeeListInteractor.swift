//
//  CoffeeListInterepter.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 15.12.2022.
//

import UIKit
import Foundation

class CoffeeListInteractor: PresenterToInteractorCoffeeListProtocol {
    weak var presenter: InteractorToPresenterCoffeeListProtocol?
    private var coffees: [CoffeeResponse]?

    func loadCoffees(coffeeType: CoffeeType) {
        CoffeeService.shared.getCoffees(coffeeType: coffeeType) { result in
            switch result {
            case .success(let success):
                self.coffees = success
                self.presenter?.fetchCoffeeSuccess(coffees: success)
            case .failure(let failure):
                self.presenter?.fetchCoffeeFailure(errorCode: 404)
            }
        }
    }

    func retrieveCoffee(at index: Int) {
        guard let coffees = self.coffees, coffees.indices.contains(index) else {
            presenter?.getCoffeeFailure()
            return
        }
        presenter?.getCoffeeSuccess(coffee: self.coffees![index])
    }
}
