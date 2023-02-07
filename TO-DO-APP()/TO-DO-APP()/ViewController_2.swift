//
//  ViewController_2.swift
//  TO-DO-APP()
//
//  Created by Fiuser on 31/01/23.
//

import UIKit
struct Task {
    let taskName : String?
    let taskDate : String?
}

class ViewController_2: UIViewController, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var plusButton: UIButton!
    var createdTaskList : [Task]!
    var taskIDCounter = 0
    
    // var bottomCardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        plusButton.layer.cornerRadius = 0.5 * plusButton.bounds.size.width
        plusButton.clipsToBounds = true
        
    }
    @IBAction func plusButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        let previousVC = self.navigationController?.viewControllers.first as! ViewController
        previousVC.nameTextField.text = ""
        previousVC.dateTextField.text = ""
        previousVC.decriptionView.text = ""
        previousVC.dateLabel.text = ""
        previousVC.nameLabel.text = ""
        previousVC.dateLabel.isHidden = true
        
    }
}

extension ViewController_2: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return createdTaskList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customCell
        cell.taskLabel.text = createdTaskList[indexPath.row].taskName
        cell.dateLabel.text = createdTaskList[indexPath.row].taskDate
        return cell
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            createdTaskList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bottomSheetVC = bottomSheetController()
        bottomSheetVC.modalPresentationStyle = .custom
        bottomSheetVC.transitioningDelegate = self
        present(bottomSheetVC, animated: true, completion: nil)
        //cell.layer.borderColor = UIColor.black.cgColor
        
    }
    
    //
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        // Add the bottom card view
    //        let bottomCardView = UIView()
    //        bottomCardView.backgroundColor = .lightGray
    //        bottomCardView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: view.frame.height / 2)
    //        view.addSubview(bottomCardView)
    //
    //        bottomCardView.translatesAutoresizingMaskIntoConstraints = false
    //        bottomCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    //        bottomCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    //        bottomCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    //        bottomCardView.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
    //        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeDown))
    //        swipeDownGesture.direction = .down
    //        bottomCardView.addGestureRecognizer(swipeDownGesture)
    //        down bottomview = area.split.fix
    //    }
    //    @objc func handleSwipeDown(gesture: UISwipeGestureRecognizer) {
    //        let bottomCardView = gesture.view
    //        UIView.animate(withDuration: 0.3) {
    //            bottomCardView?.frame.origin.y = self.view.frame.height
    //        }
    //    }
    //
    //
    //
    //
    //}
    
    //extension ViewController_2: UIViewControllerTransitioningDelegate {
    //    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    //        return BottomSheetPresentationController(presentedViewController: presented, presenting: presenting)
    //    }
    //}
    
    
    
    
}
