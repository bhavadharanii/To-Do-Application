//
//  bottomSheetController.swift
//  TO-DO-APP()
//
//  Created by Fiuser on 03/02/23.
//

import UIKit


class YourDestinationViewController: UIViewController {
    
    @IBOutlet weak var DetailedDescription: UITextView!
    var taskDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DetailedDescription.text = description
        
        if let textView = DetailedDescription {
            textView.text = taskDescription ?? ""
        } else {
            print("DetailedDescription is nil")
        }
        
    }
    
}









