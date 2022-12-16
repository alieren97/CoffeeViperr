//
//  CoffeeListInterface.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 15.12.2022.
//

import Foundation
import UIKit

protocol PresenterToViewCoffeeListProtocol: AnyObject {
    func onFetchCoffeeListSuccess()
    func onFetchCoffeeListFailure(error: String)
}

protocol ViewToPresenterCoffeeListProtocol: AnyObject {
    var view: PresenterToViewCoffeeListProtocol? { get set }
    var interactor: PresenterToInteractorCoffeeListProtocol? { get set }
    var router: PresenterToRouterCoffeeListProtocol? { get set }

    func viewDidLoad()
    func refresh(coffeeType: CoffeeType)
    func numberOfRowsInSection() -> Int
    func textLabel(indexPath: IndexPath) -> String?
    func didSelectRowAt(index: Int)
}

protocol PresenterToInteractorCoffeeListProtocol: AnyObject {
    var presenter: InteractorToPresenterCoffeeListProtocol? { get set }

    func loadCoffees(coffeeType: CoffeeType)
    func retrieveCoffee(at index: Int)
}

protocol InteractorToPresenterCoffeeListProtocol: AnyObject {
    func fetchCoffeeSuccess(coffees: [CoffeeResponse])
    func fetchCoffeeFailure(errorCode: Int)

    func getCoffeeSuccess(coffee: CoffeeResponse)
    func getCoffeeFailure()
}

protocol PresenterToRouterCoffeeListProtocol: AnyObject {
    static func createModule() -> UINavigationController
    func pushToQuoteDetail(on view: PresenterToViewCoffeeListProtocol, with coffee: CoffeeResponse)
}
