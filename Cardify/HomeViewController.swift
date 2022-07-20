//
//  HomeViewController.swift
//  Cardify
//
//  Created by user218033 on 6/19/22.
//

import UIKit
import SwiftUI
import Combine
import FirebaseAuth

class EventMessenger: ObservableObject {
    @Published var studySet: StudySet?
}

class HomeViewController: UIViewController {

    var studySet: StudySet?
    var model: StudySetModel? = StudySetModel.shared
    var notifier: EventMessenger = EventMessenger()
    
    private var subs: [AnyCancellable] = []

    @IBOutlet weak var container: UIView!
    
    @IBAction func logout(_ sender: Any) {
        if FirebaseAuth.Auth.auth().currentUser != nil {
            do {
                try FirebaseAuth.Auth.auth().signOut()
                self.performSegue(withIdentifier: "logout", sender: self)
            } catch {
                print("Couldn't log out")
            }
        }
    }
    
    @IBAction func addStudySet(_ sender: Any) {
        let dialogueMessage = UIAlertController(title: "Add New Study Set", message: nil, preferredStyle: .alert)
        dialogueMessage.addTextField { (textField) in
            textField.placeholder = "Title"
        }
        
        let create = UIAlertAction(title: "Create", style: .default) { (_) in
            if let textField = dialogueMessage.textFields?[0], let text = textField.text {
                self.model?.addStudySet(title: text, content: [])
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        dialogueMessage.addAction(cancel)
        dialogueMessage.addAction(create)
        self.present(dialogueMessage, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let home = HomeScreen()
            .environmentObject(StudySetModel.shared)
            .environmentObject(notifier)
        let childView = UIHostingController(rootView: home)
        addChild(childView)
        childView.view.frame = container.bounds
        container.addSubview(childView.view)
        
        tabBarController?.navigationController?.navigationBar.isHidden = true
        
        notifier.$studySet.sink { [weak self] s in
            self?.studySet = s
            if self!.studySet != nil {
                self!.performSegue(withIdentifier: "goToFlashCard", sender: self)
            }
        }
        .store(in: &subs)
        
        //        tableView.delegate = self
        //        tableView.dataSource = self
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

//extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return (model?.studySets.count)!
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudySetCell
//        let cellData = model?.studySets[indexPath.row]
//
//        cell.updateView(title: cellData!.title)
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        studySet = model?.studySets[indexPath.row]
//        performSegue(withIdentifier: "goToFlashCard", sender: self)
//    }
//
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let delete = UIContextualAction(style: .destructive, title: nil) {_, _, completionHandler in
//            self.model?.remove(id: (self.model?.studySets[indexPath.row].id)!)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            //tableView.reloadData()
//            completionHandler(true)
//        }
//        delete.image = UIImage(systemName: "trash")
//        delete.backgroundColor = .systemRed
//        let configuration = UISwipeActionsConfiguration(actions: [delete])
//        return configuration
//    }
//}
