//
//  CoffeeDetailInteractor.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 16.12.2022.
//

import Foundation

class CoffeeDetailInteractor: PresenterToInteractorCoffeeDetailProtocol {
    var presenter: InteractorToPresenterCoffeeDetailProtocol?
    var coffee: CoffeeResponse?

    func getImageDataFromURL() {
        KingfisherService.shared.loadImageFrom(urlString: coffee!.image) { data in
            print(data)
            self.presenter?.getImageFromURLSuccess(coffee: self.coffee!, data: data)
        } failure: { data in
            self.presenter?.getImageFromURLFailure(coffee: self.coffee!)
        }
    }
}
