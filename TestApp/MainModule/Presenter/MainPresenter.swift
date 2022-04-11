//
//  MainPresenter.swift
//  TestApp
//
//  Created by Тимур on 07.04.2022.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainTableViewProtocol, networkService: NetworkServiceProtocol)
    func getComments()
    var comments: [Comment]? { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainTableViewProtocol?
    let networkService: NetworkServiceProtocol?
    var comments: [Comment]?

    required init(view: MainTableViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComments()
    }
    
    func getComments() {
        networkService?.getComments(onSuccess: { [weak self] (comments) in
            self?.comments = comments
            self?.view?.succes()
        }, onError: { [weak self] (error) in
            self?.view?.failure(error)
        })
    }
}
