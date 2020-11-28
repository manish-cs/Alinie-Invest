//
//  AIThemesPresenter.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation

class AIThemesPresenter: AIThemesViewToPresenterProtocol {
    var view: AIThemesPresenterToViewProtocol?
    var interactor: AIThemesPresenterToInteractorProtocol?
    var router: AIThemesPresenterToRouterProtocol?
    
    func fetchCategories() -> [AIThemesViewModel] {
        return interactor?.fetchCategories() ?? []
    }
}

extension AIThemesPresenter: AIThemesInteractorToPresenterProtocol{
}
