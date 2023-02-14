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
    let taskDescription: String?
    
}

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var plusButton: UIButton!
    var createdTaskList : [Task]!
    //var bottomSheet: UIView?

    // var taskIDCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        plusButton.layer.cornerRadius = 0.5 * plusButton.bounds.size.width
        plusButton.clipsToBounds = true
        //createdTaskList = []
        
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
        createdTaskList.removeAll()

    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
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
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //            let destinationVC = YourDestinationViewController()
    //        destinationVC.taskDescription = createdTaskList[indexPath.row].taskDescription ?? ""
    //            destinationVC.modalPresentationStyle = .fullScreen
    //            self.present(destinationVC, animated: true, completion: nil)
    //        }
    
    
    
    // Add the bottom card view
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //bottomSheet?.removeFromSuperview()

        let bottomCardView = UIView()
        bottomCardView.backgroundColor = .lightGray
        bottomCardView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: view.frame.height / 2)
        view.addSubview(bottomCardView)
        //view.layer.cornerRadius = 10
        bottomCardView.layer.cornerRadius = 30
        bottomCardView.layer.borderColor = UIColor.black.cgColor
        bottomCardView.layer.borderWidth = 3
        bottomCardView.translatesAutoresizingMaskIntoConstraints = false
        bottomCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomCardView.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeDown))
        swipeDownGesture.direction = .down
        bottomCardView.addGestureRecognizer(swipeDownGesture)
        let textView = UITextView()
        textView.text = createdTaskList[indexPath.row].taskDescription
        textView.frame = CGRect(x: 20, y: 20, width: bottomCardView.frame.width - 40, height: bottomCardView.frame.height - 80)
        textView.backgroundColor = .lightGray
        textView.layer.cornerRadius = 10
        textView.isEditable = false
        textView.font = UIFont(name: "Palatino", size: 24)
        textView.textColor = .white
        bottomCardView.addSubview(textView)
    }
    @objc func handleSwipeDown(gesture: UISwipeGestureRecognizer) {
        let bottomCardView = gesture.view
        UIView.animate(withDuration: 0.3) {
            bottomCardView?.frame.origin.y = self.view.frame.height
        }
    }

}










