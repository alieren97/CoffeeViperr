//
//  CoffeeListRouter.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 15.12.2022.
//

import Foundation
import UIKit

class CoffeeListWireFrame: PresenterToRouterCoffeeListProtocol {
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        let viewController = CoffeeListViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let presenter: ViewToPresenterCoffeeListProtocol & InteractorToPresenterCoffeeListProtocol = CoffeeListPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = CoffeeListWireFrame()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CoffeeListInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return navigationController
    }

    func pushToQuoteDetail(on view: PresenterToViewCoffeeListProtocol, with coffee: CoffeeResponse) {
        let coffeeDetailViewController = CoffeeDetailWireFrame.createModule(with: coffee)
        let viewController = view as! CoffeeListViewController
        viewController.navigationController?
            .pushViewController(coffeeDetailViewController, animated: true)
    }
}
