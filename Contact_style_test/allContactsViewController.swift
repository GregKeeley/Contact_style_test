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
    
    var testContacts = CustomContact.getTestData()
    var contacts = [CNContact]()
    
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
        present(contactPicker, animated: true)
    }
}
extension allContactsViewController: CNContactPickerDelegate {
    
}
extension allContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editViewController = TableViewController()
        let contact = testContacts[indexPath.row]
        dump(contact)
        editViewController.contact = contact
    }
}

extension allContactsViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testContacts.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        let contact = testContacts[indexPath.row]
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.email
        return cell
    }
    

}
