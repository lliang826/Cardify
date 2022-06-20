//
//  HomeViewController.swift
//  Cardify
//
//  Created by user218033 on 6/19/22.
//

import UIKit

class HomeViewController: UIViewController {

    let data = DataProvider.makeData()

    lazy var studySetTableView: UITableView = {
       let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(StudySetCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true

        view.addSubview(studySetTableView)
        NSLayoutConstraint.activate([
            studySetTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            studySetTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            studySetTableView.topAnchor.constraint(equalTo: view.topAnchor),
            studySetTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudySetCell
        let cellData = data[indexPath.section]

        cell.updateView(title: cellData.title)

        return cell
    }


}
