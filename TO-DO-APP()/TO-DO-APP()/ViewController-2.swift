import UIKit

class ViewController_2: UIViewController {
    
    struct Task {
        let taskName : String?
        let taskDate : String?
        let description : String?
        
        init(taskName: String?, taskDate: String?, description: String?) {
                self.taskName = taskName
                self.taskDate = taskDate
                self.description = description
            }
    }
    
    var tasks: [Task] = []

    

//    var taskName : String?
//    var date : String?


    override func viewDidLoad() {
        super.viewDidLoad()


        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension ViewController_2: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customCell
        let task = tasks[indexPath.row]
        tasks.append(Task(taskName: "task name", taskDate: "task date", description: "task description"))

        cell.taskLabel.text = task.taskName
        cell.dateLabel.text = task.taskDate
        
        return cell
    }
}






   


