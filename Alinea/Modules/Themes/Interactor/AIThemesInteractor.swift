//
//  AIThemesInteractor.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation

class AIThemesInteractor: AIThemesPresenterToInteractorProtocol {
    var presenter: AIThemesInteractorToPresenterProtocol?
    
    func fetchCategories() -> [AIThemesViewModel] {
        return [AIThemesViewModel(title: "Diversity & Inclusion", backgroundColor: AIColor.themeBackgroundColor, imagename: "fa-dot-circle"),
                AIThemesViewModel(title: "Bold Biotech", backgroundColor: AIColor.themeBackgroundColor, imagename: "fa-check-circle"),
                AIThemesViewModel(title: "Crypto Central", backgroundColor: AIColor.themeBackgroundColor, imagename: "fa-circle"),
                AIThemesViewModel(title: "She runs it", backgroundColor: AIColor.themeBackgroundColor, imagename: "fa-dot-circle"),
                AIThemesViewModel(title: "Clean & Green", backgroundColor: AIColor.themeBackgroundColor, imagename: "fa-check-circle"),
                AIThemesViewModel(title: "Cannabis-ness", backgroundColor: AIColor.themeBackgroundColor, imagename: "fa-circle"),
                AIThemesViewModel(title: "Power it", backgroundColor: AIColor.themeBackgroundColor, imagename: "fa-dot-circle"),
                AIThemesViewModel(title: "Foodie Fun", backgroundColor: AIColor.themeBackgroundColor, imagename: "fa-check-circle"),
                AIThemesViewModel(title: "Art & Fasion", backgroundColor: AIColor.themeBackgroundColor, imagename: "fa-circle"),
                AIThemesViewModel(title: "Home is where the heart is", backgroundColor: AIColor.themeBackgroundColor, imagename: "fa-dot-circle")]
    }
}
