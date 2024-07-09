//
//  MainViewController.swift
//  pizza
//
//  Created by Володя on 06.07.2024.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {

    private lazy var pizzaTableView = {
        let view = UITableView()
        view.register(PizzaTableViewCell.self, forCellReuseIdentifier: PizzaTableViewCell.identifier)
        view.dataSource = self
        view.delegate = self
        view.separatorStyle = .none
        return view
    }()
    
    private let dataSource: [PizzaViewModel] = PizzaViewModel.mockDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWindow()
        setupViews()
    }
    
    private func setupWindow() {
        self.title = "Пицца"
    }
    
    private func setupViews() {
        self.view.addSubview(pizzaTableView)
        self.pizzaTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = pizzaTableView.indexPathForSelectedRow {
            pizzaTableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
}


extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = PizzaCardViewController()
        viewController.dataSource = dataSource
        viewController.selectedIndex = indexPath.row
        navigationController?.pushViewController(viewController, animated: true)
    }
}


extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PizzaTableViewCell.identifier, for: indexPath) as? PizzaTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(dataSource[indexPath.row])
        return cell
    }

}


#Preview {
    MainViewController()
}
