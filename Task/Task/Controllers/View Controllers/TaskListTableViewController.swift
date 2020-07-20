//
//  TaskListTableViewController.swift
//  Task
//
//  Created by adetokunbo babatunde on 6/11/20.
//  Copyright © 2020 AdetokunboBabatunde. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController, ButtonTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    func buttonCellButtonTapped(_ sender: ButtonTableViewCell) {
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.shared.tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? ButtonTableViewCell else { return UITableViewCell() }
        let task = TaskController.shared.tasks[indexPath.row]
        cell.textLabel?.text = task.name
        
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let task = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.remove(task: task)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //Identifier
        if segue.identifier == "toDetailVC" {
            //Index & Destination
            guard let indexPath = tableView.indexPathForSelectedRow, let destination = segue.destination as? TaskDetailTableViewController else {return}
            // Obeject to send
            let task = TaskController.shared.tasks[indexPath.row]
            // Object to recieve
            destination.task = task
        }
    }
}
