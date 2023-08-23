//
//  EditItemViewController.swift
//  InAppComm
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import UIKit

protocol EditItemViewControllerDelegate {
    func shouldAdd(item: String)
    func isItemPresent(item: String) -> Bool // true->item exists|false->item doesn’t exist 
}

class EditItemViewController: UIViewController {

    // MARK: - IBOutlet Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    // MARK: - Properties
    var editedItem: String?
    var delegate: EditItemViewControllerDelegate!
    
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
        guard let text = textField.text else { return }
        
        if text != "" {//we make sure that user has typed something on the textfield
            if let delegate = delegate { //we make sure that the delegate property is not nil
                if !delegate.isItemPresent(item: text) { //Item doesn't exist in the items collection, so let's add it now
                    delegate.shouldAdd(item: text) //we call the shouldAdd(item:) function of the EditItemViewControllerDelegate protocol, providing text as the argument that represents the newly added item.
                    navigationController?.popViewController(animated: true) //we dismiss the view controller by popping it from the navigation stack and we go back to our shopping list
                } else {
                    // Item exists already in the items collection.
                    // Show an alert to indicate that.
                    let alert = UIAlertController(title: "Item exists", message: "\(text) already exists in your shopping list.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    present(alert, animated: true, completion: nil)
                }
            }
            

        }
        
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


