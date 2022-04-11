//
//  DetailPresenter.swift
//  TestApp
//
//  Created by Тимур on 07.04.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(_ comment: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, comment: Comment?)
    func setupComment()
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    let comment: Comment?
    
    required init(view: DetailViewProtocol, comment: Comment?) {
        self.view = view
        self.comment = comment
    }
    
    func setupComment() {
        view?.setComment(comment)
    }
}
