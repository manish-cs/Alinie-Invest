//
//  AIExploreProtocols.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation
import UIKit

protocol AIExploreViewToPresenterProtocol: class{
    
    var view: AIExplorePresenterToViewProtocol? {get set}
    var interactor: AIExplorePresenterToInteractorProtocol? {get set}
    var router: AIExplorePresenterToRouterProtocol? {get set}
    func fetchCategories() -> [AIExploreViewModel]
}

protocol AIExplorePresenterToViewProtocol: class{
}

protocol AIExplorePresenterToRouterProtocol: class {
    static func createModule(collectionView: UICollectionView, indexPath: IndexPath, reuseIdentifier: String) -> AIExploreCollectionViewCell
}

protocol AIExplorePresenterToInteractorProtocol: class {
    var presenter:AIExploreInteractorToPresenterProtocol? {get set}
    func fetchCategories() -> [AIExploreViewModel]
}

protocol AIExploreInteractorToPresenterProtocol: class {
}
