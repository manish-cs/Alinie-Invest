//
//  AIHomePresenter.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation

class AIHomePresenter: AIHomeViewToPresenterProtocol {
    var view: AIHomePresenterToViewProtocol?
    var interactor: AIHomePresenterToInteractorProtocol?
    var router: AIHomePresenterToRouterProtocol?

    func fetchCategories() -> [AIHomeCategoriesViewModel] {
        return interactor?.fetchCategories() ?? []
    }
}

extension AIHomePresenter: AIHomeInteractorToPresenterProtocol{
}
