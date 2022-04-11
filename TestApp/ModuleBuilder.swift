//
//  ModuleBuilder.swift
//  TestApp
//
//  Created by Тимур on 07.04.2022.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(_ comment: Comment?) -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let networkService = NetworkService()
        let view = MainTableViewController()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModule(_ comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, comment: comment)
        view.presenter = presenter
        return view
    }
}
