//
//  HistoryTableViewController.swift
//  ShortIt
//
//  Created by Александр on 14/01/2022.
//

import UIKit
import SafariServices

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
        return StorageManager.shared.responces.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ShorlLinkViewCell
        
        let title = StorageManager.shared.responces[indexPath.row]
        cell.configure(with: title)
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = StorageManager.shared.responces[indexPath.row]
        guard let url = URL(string: title.longUrl) else { return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
}
