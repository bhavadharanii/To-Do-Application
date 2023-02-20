//
//  ViewController.swift
//  Cardview
//
//  Created by Fiuser on 15/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var plusButton: UIButton!
    let data = ["All                        -  15","Upcoming        -  5","Completed      -  6","Expired              -  3","OverDue            -  1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customCell
        cell.listLabel.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            
            let tabBar = self.storyboard?.instantiateViewController(identifier: "tabBar") as! tabBarController
            self.navigationController?.pushViewController(tabBar, animated: true)
        case 1:
            let upcoming = self.storyboard?.instantiateViewController(identifier: "upcoming") as! Upcoming
            self.navigationController?.pushViewController(upcoming, animated: true)
        case 2:
            let completed = self.storyboard?.instantiateViewController(identifier: "completed") as! Completed
            self.navigationController?.pushViewController(completed, animated: true)
        case 3:
            let expired = self.storyboard?.instantiateViewController(identifier: "expired") as! Expired
            self.navigationController?.pushViewController(expired, animated: true)
        case 4:
            let overDue = self.storyboard?.instantiateViewController(identifier: "overDue") as! OverDue
            self.navigationController?.pushViewController(overDue, animated: true)
        default:
            break
        }
    }
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        let previousVC = self.storyboard?.instantiateViewController(identifier: "ViewController") as! TaskViewController
        self.present(previousVC, animated: true, completion: nil)
        
    }
}
