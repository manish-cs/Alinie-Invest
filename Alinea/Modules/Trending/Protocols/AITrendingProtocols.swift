//
//  AITrendingProtocols.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation
import UIKit

protocol AITrendingViewToPresenterProtocol: class{
    
    var view: AITrendingPresenterToViewProtocol? {get set}
    var interactor: AITrendingPresenterToInteractorProtocol? {get set}
    var router: AITrendingPresenterToRouterProtocol? {get set}
    func fetchCategories() -> [AITrendingViewModel]
}

protocol AITrendingPresenterToViewProtocol: class{
}

protocol AITrendingPresenterToRouterProtocol: class {
    static func createModule(collectionView: UICollectionView, indexPath: IndexPath, reuseIdentifier: String) -> AITrendingCollectionViewCell
}

protocol AITrendingPresenterToInteractorProtocol: class {
    var presenter:AITrendingInteractorToPresenterProtocol? {get set}
    func fetchCategories() -> [AITrendingViewModel]
}

protocol AITrendingInteractorToPresenterProtocol: class {
}
