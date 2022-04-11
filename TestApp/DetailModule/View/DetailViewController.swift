//
//  DetailViewController.swift
//  TestApp
//
//  Created by Тимур on 07.04.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var commentLabel: UILabel!
    var presenter: DetailViewPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.setupComment()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(_ comment: Comment?) {
        commentLabel.text = comment?.body
    }
}
