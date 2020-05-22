//
//  TableViewController.swift
//  Contact_style_test
//
//  Created by Gregory Keeley on 5/21/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    @IBOutlet weak var addCellButton: UIButton!
    
    var contact: CustomContact? {
        didSet {
            //            DispatchQueue.main.async {
            //                self.loadContact()
            //            }
        }
    }
    
    var numberOfRowsForSection3 = 1 {
        didSet {
            tableView.reloadData()
        }
    }
    
    var cellsCollapsed = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func loadContact() {
        nameLabel.text = contact?.name
        emailLabel.text = contact?.email
        dobLabel.text = contact?.dob.description
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
        print(section)
        if section == 3 {
            return numberOfRowsForSection3
        }
        return 1
    }
}


