//
//  MainTableViewController.swift
//  TestApp
//
//  Created by Тимур on 07.04.2022.
//

import UIKit

protocol MainTableViewProtocol: AnyObject {
    func succes()
    func failure(_ error: String?)
}

class MainTableViewController: UITableViewController {
    
    var presenter: MainViewPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "MainTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MainTableViewCell.reuseId)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.comments?.count ?? 0
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseId,
                                                       for: indexPath) as? MainTableViewCell else { return UITableViewCell() }

        
        let comment = presenter?.comments?[indexPath.row]
        cell.commentLabel.text = comment?.body

        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = presenter?.comments?[indexPath.row]
        let detailVC = ModuleBuilder.createDetailModule(comment)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension MainTableViewController: MainTableViewProtocol {
    func succes() {
        tableView.reloadData()
    }
    
    func failure(_ error: String?) {
        guard let error = error else { return }
        print(error)
    }
}
