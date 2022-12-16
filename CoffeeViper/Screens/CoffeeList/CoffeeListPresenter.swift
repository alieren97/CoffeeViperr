//
//  CoffeeListPresenter.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 15.12.2022.
//

import Foundation
import UIKit

class CoffeeListPresenter: ViewToPresenterCoffeeListProtocol {
    weak var view: PresenterToViewCoffeeListProtocol?
    var interactor: PresenterToInteractorCoffeeListProtocol?
    var router: PresenterToRouterCoffeeListProtocol?

    var coffees: [CoffeeResponse]?

    func viewDidLoad() {
        interactor?.loadCoffees(coffeeType: .hot)
    }

    func refresh(coffeeType: CoffeeType) {
        interactor?.loadCoffees(coffeeType: coffeeType)
    }

    func numberOfRowsInSection() -> Int {
        return coffees?.count ?? 0
    }

    func textLabel(indexPath: IndexPath) -> String? {
        guard let coffees = self.coffees else {
            return nil
        }
        return coffees[indexPath.row].title
    }

    func didSelectRowAt(index: Int) {
        interactor?.retrieveCoffee(at: index)
    }
}

extension CoffeeListPresenter: InteractorToPresenterCoffeeListProtocol {
    func fetchCoffeeSuccess(coffees: [CoffeeResponse]) {
        self.coffees = coffees
        view?.onFetchCoffeeListSuccess()
    }

    func fetchCoffeeFailure(errorCode: Int) {
        view?.onFetchCoffeeListFailure(error: "\(errorCode)")
    }

    func getCoffeeSuccess(coffee: CoffeeResponse) {
        print("WIREFRAME: \(coffee)")
        router?.pushToQuoteDetail(on: view!, with: coffee)
    }

    func getCoffeeFailure() {
    }
}
