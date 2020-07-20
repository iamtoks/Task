//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by adetokunbo babatunde on 7/14/20.
//  Copyright © 2020 AdetokunboBabatunde. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var primaryLabel: UILabel!
    
    //MARK: - Properties
    var delegate: ButtonTableViewCellDelegate?
    
    //MARK: - Actions
    @IBAction func buttonTapped(_ sender: Any) {

        if delegate != nil {
            delegate?.buttonCellButtonTapped(sender as! ButtonTableViewCell)
        }
    }
    
    //MARK: - Helpers
    func updateButton(_ isComplete: Bool) {
        if isComplete == false {
            completeButton.setImage(UIImage(systemName: "checkmark.seal"), for: .normal)
        } else {
            completeButton.setImage(UIImage(systemName: "checkmark.seal.fill"), for: .normal)
        }
    }
}

//MARK: - Extensions
extension ButtonTableViewCell {
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(false)
    }
}

