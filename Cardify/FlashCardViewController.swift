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
    var model: StudySetModel? = StudySetModel.shared
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func testFlashCard(_ sender: Any) {
        performSegue(withIdentifier: "goToTest", sender: self)
    }
    
    @IBAction func addPairToSet(_ sender: Any) {
        print("plus button clicked")
        let dialogueMessage = UIAlertController(title: "Add New Flashcard", message: nil, preferredStyle: .alert)
        
        dialogueMessage.addTextField { (textField) in
            textField.placeholder = "Term"
        }
        
        dialogueMessage.addTextField { (textField) in
            textField.placeholder = "Definition"
        }
        
        let create = UIAlertAction(title: "Create", style: .default) { (_) in
            if let termField = dialogueMessage.textFields?[0], let term = termField.text, let definitionField = dialogueMessage.textFields?[1], let definition = definitionField.text {
                let pair = term + "@" + definition
                print("pair: " + pair)
                self.model?.updateContent(id: self.studySet!.id, content: pair)
                print(self.model?.studySets)
                self.tableView.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            self.tableView.reloadData()
        }
        
        dialogueMessage.addAction(cancel)
        dialogueMessage.addAction(create)
        self.present(dialogueMessage, animated: true, completion: nil)
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
            self.studySet?.content.shuffle()
            if let studySet = self.studySet {
                destinationVC?.studySet = studySet
            }
        }
    }
}
