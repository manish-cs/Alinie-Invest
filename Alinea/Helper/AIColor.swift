//
//  AIColor.swift
//  Alinea
//
//  Created by Manish Agrawal on 28/11/20.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
struct AIColor {
    static let purpleColor: UIColor = UIColor(hexString: "#222fc3")
    static let greyColor: UIColor = UIColor(hexString: "#515151")
    static let viewBackgroundColor: UIColor = UIColor(hexString: "#FFFFFF")
    
    static let stockBackgroundColor: UIColor = UIColor(hexString: "#a3a6f7")
    static let etfBackgroundColor: UIColor = UIColor(hexString: "#4d51c7")
    static let cryptoBackgroundColor: UIColor = UIColor(hexString: "#f8d65d")
    
    static let themeBackgroundColor: UIColor = UIColor(white: 0.98, alpha: 1)
    static let themeBorderBackgroundColor: UIColor = UIColor(white: 0.94, alpha: 1)
    
    static let profitColor: UIColor = UIColor(hexString: "#71d7b7")
    static let lossColor: UIColor = UIColor(hexString: "#ec7270")
}
