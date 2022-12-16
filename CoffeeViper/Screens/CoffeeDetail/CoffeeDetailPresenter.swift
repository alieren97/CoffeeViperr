//
//  CoffeeDetailPresenter.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 16.12.2022.
//

import Foundation

class CoffeeDetailPresenter: ViewToPresenterCoffeeDetailProtocol {
    weak var view: PresenterToViewCoffeeDetailProtocol?
    var interactor: PresenterToInteractorCoffeeDetailProtocol?
    var router: PresenterToRouterCoffeeDetailProtocol?

    func viewDidload() {
        interactor?.getImageDataFromURL()
    }
}

extension CoffeeDetailPresenter: InteractorToPresenterCoffeeDetailProtocol {
    func getImageFromURLSuccess(coffee: CoffeeResponse, data: Data?) {
        view?.onGetImageFromURLSuccess(coffee.title, description: coffee.description, image: ImageDataService.shared.convertToUIImage(from: data!))
    }
    func getImageFromURLFailure(coffee: CoffeeResponse) {
        print(coffee)
    }
}
