//
//  ListViewController.swift
//  RxApp-List
//
//  Created by Jeytery on 07.04.2022.
//

import UIKit
import SnapKit
import RxSwift 
import RxCocoa

class ListViewController: UIViewController {
    
    private let viewModel = ListViewModel()
    
    private let tableView = UITableView()
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureList()
        createAddButton()
        bind()
    }
}

private extension ListViewController {
    func configureList() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func createAddButton() {
        let addButton = UIBarButtonItem()
        addButton.title = "Add"
        navigationItem.leftBarButtonItem = addButton
    }
    
    func bind() {
        //addButton.rx.tap.
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 0
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        return UITableViewCell()
    }
}
