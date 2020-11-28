//
//  AIHomeViewToPresenterProtocol.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation

protocol AIHomeViewToPresenterProtocol: class{
    
    var view: AIHomePresenterToViewProtocol? {get set}
    var interactor: AIHomePresenterToInteractorProtocol? {get set}
    var router: AIHomePresenterToRouterProtocol? {get set}
    
    func fetchCategories() -> [AIHomeCategoriesViewModel]
}

protocol AIHomePresenterToViewProtocol: class{
}

protocol AIHomePresenterToRouterProtocol: class {
    static func createModule()-> AIHomeViewController
}

protocol AIHomePresenterToInteractorProtocol: class {
    var presenter:AIHomeInteractorToPresenterProtocol? {get set}
    func fetchCategories() -> [AIHomeCategoriesViewModel] 
}

protocol AIHomeInteractorToPresenterProtocol: class {
    
}
