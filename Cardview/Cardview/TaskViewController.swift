//
//  TaskViewController.swift
//  Cardview
//
//  Created by Fiuser on 20/02/23.
//

import UIKit

class TaskViewController: UIViewController,UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var buttonYes: UIButton!
    @IBOutlet weak var buttonNo: UIButton!
    @IBOutlet weak var decriptionView: UITextView!
    @IBOutlet weak var createButton: UIButton!
    
    //var taskslist : [Task] = []
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        nameTextField.delegate = self
        decriptionView.delegate = self
        nameLabel.isHidden = true
        createButton.layer.cornerRadius = 20
        decriptionView.layer.cornerRadius = 10
        nameTextField.layer.cornerRadius = 10
        dateTextField.layer.cornerRadius = 10
        datePicker.minimumDate = Date()
        
    }
    
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = createToolbar()
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        self.dateTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    //taskfield limitations
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxCharacters = 20
        let minCharacters = 10
        let currentString :NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        if newString.length > maxCharacters {
            nameLabel.isHidden = false
            nameLabel.text = "Maximum limit"
        }
        else if newString.length == minCharacters {
            nameLabel.isHidden = false
            nameLabel.text = "Minimum limit"
        }
        else {
            nameLabel.isHidden = true
        }
        return newString.length <= maxCharacters
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let minCharacters = 10
        let maxCharacters = 80
        let currentString :NSString = (textView.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: text) as NSString
        if newString.length == minCharacters {
            dateLabel.isHidden = false
            dateLabel.text = "Minimum limit"
        } else if newString.length > maxCharacters {
            dateLabel.isHidden = false
            dateLabel.text = "Maximum limit"
        } else {
            dateLabel.isHidden = true
        }
        return newString.length  <= maxCharacters
    }
    
    @IBAction func createButtonTapped(_ sender: UIButton){
         
        let vc = storyboard?.instantiateViewController(withIdentifier: "upcoming") as! Upcoming
        self.present(vc, animated: true, completion: nil)

    }

    @IBAction func remainderselectio(_ sender: UIButton) {
        if sender == buttonYes{
            buttonYes.isSelected = true
            buttonNo.isSelected = false
        }else {
            buttonYes.isSelected = false
            buttonNo.isSelected = true
        }
    }
    
}







//let storyboard = UIStoryboard(name: "Main", bundle: nil)
//let viewController = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
////            return viewController
////        }()
//let task = Task(taskName: nameTextField.text, taskDate: dateTextField.text,taskDescription: decriptionView.text)
//taskslist.append(task)
//viewController.createdTaskList = taskslist
//if (self.navigationController?.children == nil) {
//if let listViewController = self.navigationController?.presentedViewController as? ListViewController {
//    listViewController.customtableView.reloadData()
//}
//self.dismiss(animated: true, completion: {
//    viewController.customtableView.reloadData()
//})
//} else {
//self.navigationController?.pushViewController(viewController, animated: true)
//}
//
