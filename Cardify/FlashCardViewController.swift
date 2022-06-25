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
    var flashCardTitle: String?
    
    @IBAction func testFlashCard(_ sender: Any) {
        print("test button clicked")
        
        performSegue(withIdentifier: "goToTest", sender: self)
    }
    
    @IBAction func addPairToSet(_ sender: Any) {
        print("plus button clicked")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = flashCardTitle
        
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
        let cellData = data[indexPath.row].content
        
//        print("cell at section \(indexPath.section) and row \(indexPath.row) is selected")
        
        var content: [(String, String)] = []
        for d in data {
            if d.title == flashCardTitle {
                content = d.content
            }
        }
        
        for pair in cellData {
            cell.updateView(question: pair.question, answer: pair.answer)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTest" {
            let destinationVC = segue.destination as? TestViewController
            if let title = self.flashCardTitle {
                destinationVC?.flashCardTitle = title
            }
        }
    }
}
