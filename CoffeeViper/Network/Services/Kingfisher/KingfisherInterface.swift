//
//  KingfisherInterface.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 16.12.2022.
//

import Foundation
import Kingfisher

protocol KingfisherInterface: AnyObject {
    func loadImageFrom(urlString: String,
                       success: @escaping (Data) -> (),
                       failure: @escaping (KingfisherError) -> ())
}
