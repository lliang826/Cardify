//
//  FlashCardViewController.swift
//  Cardify
//
//  Created by user218033 on 6/21/22.
//

import UIKit

class FlashCardViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = DataProvider.makeData()
    var flashCardTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Hello"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension FlashCardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        for d in data {
            if d.title == flashCardTitle {
                return d.content.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FlashCardCell
        let cellData = data[indexPath.row]
        
        var content: [(String, String)] = []
        for d in data {
            if d.title == flashCardTitle {
                content = d.content
            }
        }
        
        for pair in content {
            cell.updateView(question: pair.0, answer: pair.1)
        }
        
        return cell
    }
}
