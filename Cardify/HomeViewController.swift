//
//  HomeViewController.swift
//  Cardify
//
//  Created by user218033 on 6/19/22.
//

import UIKit

class HomeViewController: UIViewController {

    let data = DataProvider.makeData()

    @IBOutlet weak var tableView: UITableView!
    var rowTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.navigationController?.navigationBar.isHidden = true
        UITabBar.appearance().tintColor = UIColor(hexString: "#5D1049")
        
        tableView.delegate = self
        tableView.dataSource = self
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
        let cellData = data[indexPath.row]

        cell.updateView(title: cellData.title)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell at section \(indexPath.section) and row \(indexPath.row) is selected")
        rowTitle = data[indexPath.row].title
        print(rowTitle!)
        
        performSegue(withIdentifier: "goToFlashCard", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFlashCard" {
            let destinationVC = segue.destination as? FlashCardViewController
            if let title = rowTitle {
                destinationVC?.flashCardTitle = title
            }
        }
    }
}
