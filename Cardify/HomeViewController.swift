//
//  HomeViewController.swift
//  Cardify
//
//  Created by user218033 on 6/19/22.
//

import UIKit

class HomeViewController: UIViewController {

//    let data = DataProvider.makeData()
    var studySet: StudySet?
    var model: StudySetModel?

    @IBOutlet weak var tableView: UITableView!
    var rowTitle: String?
    
    @IBAction func addStudySet(_ sender: Any) {
        let dialogueMessage = UIAlertController(title: "Add New Study Set", message: nil, preferredStyle: .alert)
        dialogueMessage.addTextField { (textField) in
            textField.placeholder = "Title"
        }
        
        let create = UIAlertAction(title: "Create", style: .default) { (_) in
            if let textField = dialogueMessage.textFields?.first, let text = textField.text {
                print("Title: " + text)
                
                
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        dialogueMessage.addAction(cancel)
        dialogueMessage.addAction(create)
        self.present(dialogueMessage, animated: true, completion: nil)
    }
    
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
        return (model?.studySets.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudySetCell
//        let cellData = data[indexPath.row]
        let cellData = model?.studySets[indexPath.row]

        cell.updateView(title: cellData!.title)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell at section \(indexPath.section) and row \(indexPath.row) is selected")
//        rowTitle = data[indexPath.row].title
//        studySet = data[indexPath.row]
        rowTitle = model?.studySets[indexPath.row].title
        studySet = model?.studySets[indexPath.row]
        print(rowTitle!)
        print(studySet!)
        
        performSegue(withIdentifier: "goToFlashCard", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFlashCard" {
            let destinationVC = segue.destination as? FlashCardViewController
            if let studySet = self.studySet {
                destinationVC?.studySet = studySet
            }
        }
    }
}
