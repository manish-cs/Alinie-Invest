//
//  AITabbarProtocols.swift
//  Alinea
//
//  Created by Manish Agrawal on 23/11/20.
//

import Foundation
import UIKit

protocol AITabBarViewToPresenterProtocol: class{
    
    var view: AITabBarPresenterToViewProtocol? {get set}
    var interactor: AITabBarPresenterToInteractorProtocol? {get set}
    var router: AITabBarPresenterToRouterProtocol? {get set}

    func fetchTabData() -> [AITabbarViewModel]
    func getViewForTab(type: TabType) -> UIViewController?
}

protocol AITabBarPresenterToViewProtocol: class{
    func loadViewData()
}

protocol AITabBarPresenterToRouterProtocol: class {
    static func createModule()-> AITabBarViewController
    func getHomeRootView() -> UIViewController
    func getOtherModule() -> UIViewController
}

protocol AITabBarPresenterToInteractorProtocol: class {
    var presenter:AITabBarInteractorToPresenterProtocol? {get set}
    func fetchTabData() -> [AITabbarViewModel]
}

protocol AITabBarInteractorToPresenterProtocol: class {
}
