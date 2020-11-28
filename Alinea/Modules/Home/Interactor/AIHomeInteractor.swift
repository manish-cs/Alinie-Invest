//
//  AIHomeInteractor.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation

class AIHomeInteractor: AIHomePresenterToInteractorProtocol{
    var presenter: AIHomeInteractorToPresenterProtocol?
    
    func fetchCategories() -> [AIHomeCategoriesViewModel] {
        return [AIHomeCategoriesViewModel(title: "Category", type: .categories),
                AIHomeCategoriesViewModel(title: "Themes", type: .theme),
                AIHomeCategoriesViewModel(title: "Trending", type: .trending)]
    }
}
