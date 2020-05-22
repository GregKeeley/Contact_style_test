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
    
    var numberOfRows = 1 {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func loadContact() {
        nameLabel.text = contact?.name
        emailLabel.text = contact?.email
        dobLabel.text = contact?.dob.description
        }
    
    
    @IBAction func addCellsButtonPressed(_ sender: UIButton) {
        
        numberOfRows = 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
}


