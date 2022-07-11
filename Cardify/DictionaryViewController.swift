//
//  DictionaryViewController.swift
//  Cardify
//
//  Created by user218033 on 6/19/22.
//

import UIKit
import Alamofire

class DictionaryViewController: UIViewController {
    
    var data: DataRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Lookup definitions"
        
        let networkingAF = NetworkingLayerAF()
        networkingAF.getAllDefinitions(word: "hello")
        print("HERE IS THE DATA: ")
        print(networkingAF.items)
        print("done")
    }
}

//extension DictionaryViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}
