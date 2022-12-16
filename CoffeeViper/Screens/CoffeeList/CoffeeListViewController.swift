//
//  CoffeeListViewController.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 15.12.2022.
//

import UIKit
import SnapKit

final class CoffeeListViewController: UIViewController {
    let items = ["Hot", "Iced"]
    var presenter: ViewToPresenterCoffeeListProtocol?

    lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(segment)
        view.addSubview(tableView)
        return view
    }()

    lazy var segment: UISegmentedControl = {
        let segment = UISegmentedControl(items: items)
        segment.addTarget(self, action: #selector(changeCoffeType), for: .valueChanged)
        segment.selectedSegmentIndex = 0
        return segment
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 70
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    @objc private func changeCoffeType(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            presenter?.refresh(coffeeType: .hot)
        case 1:
            presenter?.refresh(coffeeType: .iced)
        default:
            break
        }
    }
}

extension CoffeeListViewController: PresenterToViewCoffeeListProtocol {
    func onFetchCoffeeListSuccess() {
        tableView.reloadData()
    }

    func onFetchCoffeeListFailure(error: String) {
        print(error)
    }
}

extension CoffeeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRowsInSection() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter?.textLabel(indexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter?.didSelectRowAt(index: indexPath.row)
    }
}

extension CoffeeListViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        self.view.addSubview(containerView)
        containerView.snp.makeConstraints { $0.edges.equalToSuperview() }
        segment.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(30)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segment.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
        self.navigationItem.title = "Coffee"
    }
}
