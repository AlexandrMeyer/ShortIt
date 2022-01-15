//
//  HistoryTableViewController.swift
//  ShortIt
//
//  Created by Александр on 14/01/2022.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    private let reuseIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ShorlLinkViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StorageManager.shared.linkArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ShorlLinkViewCell
        
        let title = StorageManager.shared.linkArray[indexPath.row]
        cell.configure(with: title)
        return cell
    }
}
