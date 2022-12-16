//
//  CoffeeImageView.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 16.12.2022.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class CoffeeImageView: UIView {

    var imageName: UIImage?

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        setupView()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(imageView)
    }

    private func setupLayout() {
        layer.cornerRadius = 50
        layer.masksToBounds = true
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
