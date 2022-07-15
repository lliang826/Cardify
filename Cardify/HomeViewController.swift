//
//  HomeViewController.swift
//  Cardify
//
//  Created by user218033 on 6/19/22.
//

import UIKit

class HomeViewController: UIViewController {

    var studySet: StudySet?
    var model: StudySetModel? = StudySetModel.shared

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addStudySet(_ sender: Any) {
        let dialogueMessage = UIAlertController(title: "Add New Study Set", message: nil, preferredStyle: .alert)
        dialogueMessage.addTextField { (textField) in
            textField.placeholder = "Title"
        }
        
        let create = UIAlertAction(title: "Create", style: .default) { (_) in
            if let textField = dialogueMessage.textFields?[0], let text = textField.text {
                print("Title: " + text)
                self.model?.addStudySet(title: text, content: [])
            }
            print(self.model?.studySets)
            self.tableView.reloadData()
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
        let cellData = model?.studySets[indexPath.row]

        cell.updateView(title: cellData!.title)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        studySet = model?.studySets[indexPath.row]
        performSegue(withIdentifier: "goToFlashCard", sender: self)
    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            tableView.beginUpdates()
//            self.model?.remove(id: (self.model?.studySets[indexPath.row].id)!)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.endUpdates()
//        }
//    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: nil) {_, _, completionHandler in
            self.model?.remove(id: (self.model?.studySets[indexPath.row].id)!)
            tableView.reloadData()
            completionHandler(true)
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [delete])
        return configuration
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
