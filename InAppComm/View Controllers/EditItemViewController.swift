//
//  EditItemViewController.swift
//  InAppComm
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import UIKit


class EditItemViewController: UIViewController {

    // MARK: - IBOutlet Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    // MARK: - Properties
    var editedItem: String?
    
    // MARK: - View Init Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        // Show the keyboard automatically when the view is about to appear.
        textField.becomeFirstResponder()
    }
    
    // MARK: - Custom Methods
    
    fileprivate func setupUI() {
        textField.delegate = self
        
        if editedItem == nil {
            deleteButton.isEnabled = false
        } else {
            textField.text = editedItem
        }
    }
    
    // MARK: - IBAction Methods
    @IBAction func saveItem(_ sender: Any) {
        
    }
    @IBAction func deleteItem(_ sender: Any) {
        
    }
    
}




// MARK: - UITextFieldDelegate
extension EditItemViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveItem(self)
        return true
    }
}


