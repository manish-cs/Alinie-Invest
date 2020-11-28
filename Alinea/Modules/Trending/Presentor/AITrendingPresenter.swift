//
//  AITrendingPresenter.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation

class AITrendingPresenter: AITrendingViewToPresenterProtocol {
    var view: AITrendingPresenterToViewProtocol?
    var interactor: AITrendingPresenterToInteractorProtocol?
    var router: AITrendingPresenterToRouterProtocol?
    
    func fetchCategories() -> [AITrendingViewModel] {
        return interactor?.fetchCategories() ?? []
    }
}

extension AITrendingPresenter: AITrendingInteractorToPresenterProtocol{
}
