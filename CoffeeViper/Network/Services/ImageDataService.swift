//
//  ImageDataService.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 16.12.2022.
//

import Foundation
import UIKit

class ImageDataService {

    static let shared = { ImageDataService() }()

    func convertToUIImage(from data: Data) -> UIImage {
        return UIImage(data: data)!
    }
}
