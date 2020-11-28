//
//  AIThemesProtocols.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation
import UIKit

protocol AIThemesViewToPresenterProtocol: class{
    
    var view: AIThemesPresenterToViewProtocol? {get set}
    var interactor: AIThemesPresenterToInteractorProtocol? {get set}
    var router: AIThemesPresenterToRouterProtocol? {get set}
    func fetchCategories() -> [AIThemesViewModel]
}

protocol AIThemesPresenterToViewProtocol: class{
}

protocol AIThemesPresenterToRouterProtocol: class {
    static func createModule(collectionView: UICollectionView, indexPath: IndexPath, reuseIdentifier: String) -> AIThemesCollectionViewCell
}

protocol AIThemesPresenterToInteractorProtocol: class {
    var presenter:AIThemesInteractorToPresenterProtocol? {get set}
    func fetchCategories() -> [AIThemesViewModel]
}

protocol AIThemesInteractorToPresenterProtocol: class {
}
