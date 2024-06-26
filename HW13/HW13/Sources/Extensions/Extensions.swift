//
//  Extensions.swift
//  HW13
//
//  Created by Илья Капёрский on 12.09.2023.
//

import UIKit

extension UIImage {
    func resizeImage(_ width: Int, _ height: Int)-> UIImage?{
        let newSize = CGSize(width: width, height: height) // Новый размер изображения
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
