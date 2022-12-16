//
//  CoffeeDetailViewController.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 16.12.2022.
//

import Foundation
import UIKit
import SnapKit

class CoffeeDetailViewController: UIViewController {

    var presenter: ViewToPresenterCoffeeDetailProtocol?

    lazy var coffeeImageView: CoffeeImageView = {
        let imageView = CoffeeImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidload()
    }
}

extension CoffeeDetailViewController: PresenterToViewCoffeeDetailProtocol {
    func onGetImageFromURLSuccess(_ coffeeName: String, description: String, image: UIImage) {
        titleLabel.text = coffeeName
        descriptionLabel.text = description
        coffeeImageView.imageView.image = image
        self.navigationItem.title = coffeeName

    }

    func onGetImageFromURLFailure(_ coffeeName: String, description: String) {
        titleLabel.text = coffeeName
        descriptionLabel.text = description
        self.navigationItem.title = coffeeName
    }
}

extension CoffeeDetailViewController {
    func setupUI() {
        view.addSubview(coffeeImageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)

        coffeeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.height.width.equalTo(250)
            make.centerX.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(coffeeImageView.snp.bottom).offset(50)
            make.leading.equalToSuperview().inset(20)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
