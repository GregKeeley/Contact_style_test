//
//  TableViewController.swift
//  Contact_style_test
//
//  Created by Gregory Keeley on 5/21/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit
import Contacts

class TableViewController: UITableViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
//    @IBOutlet weak var addCellButton: UIButton!
    
    var contact: CustomContact? {
        didSet {
//            dump(contact)
        }
    }
    var cnContact: CNContact? {
        didSet {
//            dump(cnContact)
        }
    }
    
    var numberOfRowsForSection3 = 1 {
        didSet {
            tableView.reloadData()
        }
    }
    
    var cellsCollapsed = true
    var cellItems = ["name", "email", "phoneNumber"]
    
    init(contact: CustomContact) {
        self.contact = contact
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    private func registerCells() {
        for item in cellItems {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: item)
        }
        tableView.register(AddCellsCell.self, forCellReuseIdentifier: "addCells")
    }
    
    @IBAction func addCellsButtonPressed(_ sender: UIButton) {
        if cellsCollapsed {
            numberOfRowsForSection3 = 1
            cellsCollapsed.toggle()
        } else {
            numberOfRowsForSection3 = 4
            cellsCollapsed.toggle()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3 {
            return numberOfRowsForSection3
        }
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            dump(contact)
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath)
                let name = contact?.firstName
                cell.textLabel?.text = name
                cell.textLabel?.text = "name"
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "email", for: indexPath)
                let email = contact?.workEmail
                cell.textLabel?.text = email
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "phoneNumber", for: indexPath)
                let phoneNumber = contact?.phoneNumberField
                cell.textLabel?.text = phoneNumber?.description
                return cell
                //        case 3:
                //            switch indexPath.row {
                //            case 0:
                //                guard let cell = tableView.dequeueReusableCell(withIdentifier: "addCells", for: indexPath) as? AddCellsCell else {
                //                    fatalError("failed to dequeue addCellsCell")
                //                }
                //                cell.addCellsButton.setTitle("Add Cells", for: .normal)
                ////                cell.configureCell()
                //                return cell
                //            default:
                //                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
                //                cell.textLabel?.text = ("\(indexPath.row)")
                //                return cell
            //            }
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath)
                let name = contact?.firstName
                cell.textLabel?.text = name
                return cell
            }
        }

}


