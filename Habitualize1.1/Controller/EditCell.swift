//
//  EditCell.swift
//  Habitualize1.1
//
//  Created by Carter Sloan on 10/29/18.
//  Copyright © 2018 Carter Sloan. All rights reserved.
//

import UIKit

class EditCell: UITableViewCell {
    
    var editTag = -1
        
    @IBOutlet weak var EditLabel: UILabel!
    @IBOutlet weak var EditTextField: UITextField!
    
    func getLabel() -> String {
        return self.EditLabel.text ?? ""
    }
    
    func setLabel(label: String) {
        self.EditLabel.text = label
    }
    
    func getText() -> String {
        return self.EditTextField.text ?? ""
    }
    
    func setText(index: Int, text: String) {
        self.EditTextField.text = text
        if (index > 0) {
            self.EditTextField.keyboardType = UIKeyboardType.decimalPad
        }
        
    }
    
    func setEditTag(tag: Int) {
        self.editTag = tag
    }
}
