//
//  DictionaryViewController.swift
//  Cardify
//
//  Created by user218033 on 6/19/22.
//

import UIKit
import Alamofire
import SwiftUI

class DictionaryViewController: UIViewController {
    
    @IBOutlet weak var theContainer: UIView!
    var data: DataRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Lookup definitions"
        
        let childView = UIHostingController(rootView: DictionaryScreen())
        addChild(childView)
        childView.view.frame = theContainer.bounds
        theContainer.addSubview(childView.view)
    }
}
