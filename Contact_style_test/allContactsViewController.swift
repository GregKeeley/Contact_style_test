//
//  ViewController.swift
//  Contact_style_test
//
//  Created by Gregory Keeley on 5/21/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class allContactsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var testContacts = CustomContact.defaultContacts()
    
    var contacts = [CNContact]()
    
//MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
//MARK:- Presents the native iOS contacts View Controller to ge the user
    @IBAction func addContactButtonPressed(_ sender: UIBarButtonItem) {
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        //Note: This is where we can create a predicate to only allow certain contacts on the CNContactPickerViewController to be highlighted
        //Question: How to create a predicate? The formatting below is not something I am familiar with. It's contained within a string and has an "@" before the condition
        contactPicker.predicateForEnablingContact = NSPredicate(format: "emailAddresses.@count > 0")
        present(contactPicker, animated: true)
    }
}
//MARK:- CNContactPickerDelegate
extension allContactsViewController: CNContactPickerDelegate {
    //Note: There is a delegate for a single contact and multiple!
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        //Note: This compactMap uses the contact from the convenience init in CustomContact class
        let contacts = contacts.compactMap { CustomContact(contact: $0) }
        for contact in contacts {
            if !testContacts.contains(contact) {
                testContacts.append(contact)
            }
        }
        tableView.reloadData()
    }
}

//MARK:- TableViewDelegate & DataSource
extension allContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let contact = testContacts[indexPath.row]
//        let editViewController = TableViewController(contact: contact)
        let contactViewController = CNContactViewController(forUnknownContact: contact.contactValue)
//        editViewController.contact = contact
//        editViewController.cnContact = contact.contactValue
//        navigationController?.pushViewController(editViewController, animated: true)
        navigationController?.pushViewController(contactViewController, animated: true)
    }
}

extension allContactsViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testContacts.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        let contact = testContacts[indexPath.row]
        cell.textLabel?.text = contact.firstName
        cell.detailTextLabel?.text = contact.workEmail
        return cell
    }
    

}
