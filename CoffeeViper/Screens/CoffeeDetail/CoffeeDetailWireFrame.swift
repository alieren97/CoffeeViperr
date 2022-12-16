//
//  CoffeeDetailWireFrame.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 16.12.2022.
//

import Foundation
import UIKit

class CoffeeDetailWireFrame: PresenterToRouterCoffeeDetailProtocol {
    // MARK: Static methods
    static func createModule(with coffee: CoffeeResponse) -> UIViewController {
        let viewController = CoffeeDetailViewController()

        let presenter: ViewToPresenterCoffeeDetailProtocol & InteractorToPresenterCoffeeDetailProtocol = CoffeeDetailPresenter()

        viewController.presenter = presenter
        viewController.presenter?.router = CoffeeDetailWireFrame()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CoffeeDetailInteractor()
        viewController.presenter?.interactor?.coffee = coffee
        viewController.presenter?.interactor?.presenter = presenter

        return viewController
    }
}
