//
//  FlashCardViewController.swift
//  Cardify
//
//  Created by user218033 on 6/21/22.
//

import UIKit

class FlashCardViewController: UIViewController {
    
//    let data = DataProvider.makeData()
    var studySet: StudySet?
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func testFlashCard(_ sender: Any) {
        print("test button clicked")
        
        performSegue(withIdentifier: "goToTest", sender: self)
    }
    
    @IBAction func addPairToSet(_ sender: Any) {
        print("plus button clicked")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = studySet!.title
        print(studySet!)
        
        tableView.delegate = self
        tableView.dataSource = self

    }
}

extension FlashCardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studySet!.content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FlashCardCell
        
//        cell.updateView(question: (studySet?.content[indexPath.row].question)!, answer: (studySet?.content[indexPath.row].answer)!)
        
        let content = studySet?.content[indexPath.row]
        let contentArray = content?.components(separatedBy: "@")
        let question: String = contentArray![0]
        let answer: String = contentArray![1]
        
        cell.updateView(question: question, answer: answer)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTest" {
            let destinationVC = segue.destination as? TestViewController
            if let studySet = self.studySet {
                destinationVC?.studySet = studySet
            }
        }
    }
}
