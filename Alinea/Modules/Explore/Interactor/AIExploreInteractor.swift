//
//  AIExploreInteractor.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation

class AIExploreInteractor: AIExplorePresenterToInteractorProtocol {
    var presenter: AIExploreInteractorToPresenterProtocol?
    
    func fetchCategories() -> [AIExploreViewModel] {
        return [AIExploreViewModel(title: "Stocks", backgroundColor: AIColor.stockBackgroundColor, imagename: "fa-dot-circle"),
                AIExploreViewModel(title: "ETFs", backgroundColor: AIColor.etfBackgroundColor, imagename: "fa-check-circle"),
                AIExploreViewModel(title: "Crypto", backgroundColor: AIColor.cryptoBackgroundColor, imagename: "fa-circle")]
    }
}
