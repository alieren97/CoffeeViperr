//
//  CoffeeDetailInterface.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 16.12.2022.
//

import Foundation
import UIKit

protocol ViewToPresenterCoffeeDetailProtocol: AnyObject {
    var view: PresenterToViewCoffeeDetailProtocol? { get set }
    var interactor: PresenterToInteractorCoffeeDetailProtocol? { get set }
    var router: PresenterToRouterCoffeeDetailProtocol? { get set }

    func viewDidload()
}

protocol PresenterToViewCoffeeDetailProtocol: AnyObject {
    func onGetImageFromURLSuccess(_ coffeeName: String, description: String, image: UIImage)
    func onGetImageFromURLFailure(_ coffeeName: String, description: String)
}

protocol PresenterToInteractorCoffeeDetailProtocol: AnyObject {
    var presenter: InteractorToPresenterCoffeeDetailProtocol? {get set}
    var coffee: CoffeeResponse? { get set }
    func getImageDataFromURL()
}

protocol InteractorToPresenterCoffeeDetailProtocol: AnyObject {
    func getImageFromURLSuccess(coffee: CoffeeResponse, data: Data?)
    func getImageFromURLFailure(coffee: CoffeeResponse)
}

protocol PresenterToRouterCoffeeDetailProtocol: AnyObject {
    static func createModule(with coffee: CoffeeResponse) -> UIViewController
}

