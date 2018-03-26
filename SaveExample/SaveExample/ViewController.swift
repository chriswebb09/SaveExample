//
//  ViewController.swift
//  SaveExample
//
//  Created by Christopher Webb-Orenstein on 3/26/18.
//  Copyright © 2018 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: TableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        let store = ItemStore()
        store.add(listener: self)
        self.dataSource = TableViewDataSource(store: store)
        tableView.dataSource = dataSource
    }

    @IBAction func saveItem(_ sender: Any) {
        dataSource.updateItem()
    }
}

extension ViewController: Synchronizer {
    
    func didUpdate() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func willUpdate() {
        print("about to reload tableView")
    }
    
}

