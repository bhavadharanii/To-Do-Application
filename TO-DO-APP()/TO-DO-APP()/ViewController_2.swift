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

class ViewController_2: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var plusButton: UIButton!
    var createdTaskList : [Task]!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    @IBAction func plusButtonTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
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
    
}

