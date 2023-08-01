//
//  DashboardDashboardViewController.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import UIKit

final class EditableDashboardViewController: UIViewController, EditableDashboardViewInput {
 
    @IBOutlet weak var emptyLabel: UILabel!
    
    var output: EditableDashboardViewOutput?
    
    var tableView: UITableView!
    var persons: [Persons] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.viewIsReady()
    }
    
    func setupInitialState() {
        addNavigationBarButton()
        setupTableView()
        addNavigationBarButton()
        refreshData(with: persons)
    }

    private func addNavigationBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        output?.openAddUser()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(.init(nibName: UserTableViewCell.reusedId, bundle: nil), forCellReuseIdentifier: UserTableViewCell.reusedId)
    }
    
    func refreshData(with persons: [Persons]) {
        self.persons = persons
        tableView.isHidden = persons.count <= 0
        emptyLabel.isHidden = !(persons.count <= 0)
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.refresh()
    }
}

extension EditableDashboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reusedId, for: indexPath) as!  UserTableViewCell
        cell.fill(with: persons[indexPath.row])
        return cell
    }
}
