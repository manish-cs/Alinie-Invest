//
//  AIExplorePresenter.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation

class AIExplorePresenter: AIExploreViewToPresenterProtocol {
    var view: AIExplorePresenterToViewProtocol?
    var interactor: AIExplorePresenterToInteractorProtocol?
    var router: AIExplorePresenterToRouterProtocol?
    
    func fetchCategories() -> [AIExploreViewModel] {
        return interactor?.fetchCategories() ?? []
    }
}

extension AIExplorePresenter: AIExploreInteractorToPresenterProtocol{
}
