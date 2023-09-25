//
//  Model.swift
//  HW13
//
//  Created by Илья Капёрский on 23.09.2023.
//

import UIKit

struct Model: Hashable {
    let image: UIImage
    let name: String
    let text: String?
    let needSwitch: Bool
    let notifyCount: Int
}
