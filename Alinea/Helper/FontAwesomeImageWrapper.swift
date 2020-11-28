//
//  FontAwesomeImageWrapper.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation
import FontAwesome_swift
import UIKit

struct FontAwesomeImageWrapper {
    static func getImage(name: String, size: CGSize = CGSize(width: 32, height: 32), color: UIColor = .purple) -> UIImage {
        UIImage.fontAwesomeIcon(name: FontAwesome(rawValue: name)!, style: FontAwesomeStyle.solid, textColor: color, size: size)
    }
}
