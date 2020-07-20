//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by adetokunbo babatunde on 6/11/20.
//  Copyright © 2020 AdetokunboBabatunde. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    //MARK: - Properties
    var task: Task? {
            didSet {
                updateViews()
//print("Old Value: \(oldValue).")
            } willSet {
 //               print("New Value: \(newValue)")
            }
    }
    
    var dueDateValue: Date?
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTextField.inputView = dueDatePicker
        updateViews()
    }
    
    //MARK: - Actions
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty, let note = notesTextView.text, !note.isEmpty else {return}
        
        let date = dueDateValue
        
        if let task = task {
            TaskController.shared.update(task: task, name: name, notes: note, due: date)
        } else {
            TaskController.shared.add(taskWithName: name, notes: note, due: date)
        }
        updateViews()
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dueDatePicker(_ sender: UIDatePicker) {
        dueDateValue = sender.date
        dateTextField.text = sender.date.stringValue()
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        nameTextField.resignFirstResponder()
        dateTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
    }
    
    //MARK: - Helper Methods
    func updateViews() {
        guard let task = task else {return}
        dateTextField.text = task.due?.stringValue()
        nameTextField.text = task.name
        notesTextView.text = task.notes
        self.tableView.reloadData()
    }
    
}


