//
//  bottomSheetController.swift
//  TO-DO-APP()
//
//  Created by Fiuser on 03/02/23.
//

import UIKit

class bottomSheetController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: view.frame.width, height: view.frame.height / 4)
    }
    
}

//    extension bottomSheetController: UIViewControllerTransitioningDelegate {
//        func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
//            // Initialize the BottomSheetPresentationController and return it
//            return BottomSheetPresentationController(presentedViewController: presented, presenting: presenting)
//        }
//    }

    
    

  

