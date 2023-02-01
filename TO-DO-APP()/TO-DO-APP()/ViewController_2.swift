//
//  ViewController_2.swift
//  TO-DO-APP()
//
//  Created by Fiuser on 31/01/23.
//
    
    import UIKit

    class ViewController_2: UIViewController {
//        struct Task {
//                let taskName : String?
//                let taskDate : String?
//
//                init(taskName: String?, taskDate: String?) {
//                        self.taskName = taskName
//                        self.taskDate = taskDate
//                    }
//            }
//
//            var tasks = [Task]()

        
        @IBOutlet weak var tableView: UITableView!
        
        var taskName : String?
        var taskDate : String?


        override func viewDidLoad() {
            super.viewDidLoad()


            tableView.delegate = self
            tableView.dataSource = self
        }
    }
extension ViewController_2: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customCell
        //let task = tasks[indexPath.row]
        //tasks.append(Task(taskName: "task name", taskDate: "task date", description: "task description"))
        
        cell.taskLabel.text = taskName
        cell.dateLabel.text = taskDate
        
        return cell
        
        
        //        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customCell
        //            let task = tasks[indexPath.row]
        //
        //            cell.taskLabel.text = task.taskName
        //            cell.dateLabel.text = task.taskDate
        //
        //            return cell
        //        }
        
        
    }
}
    






       





