//
//  Model.swift
//  HW13
//
//  Created by Илья Капёрский on 04.09.2023.
//

import UIKit

final class SettingsModel {
    func createModel() -> [[Model]]  {
        [
         [Model(image: (UIImage(named: "airplane")?.resizeImage(25, 25))!, name: "Авиарежим", text: nil, needSwitch: true, notifyCount: 0),
          Model(image: (UIImage(named: "wifi")?.resizeImage(25, 25))!, name: "Wi-Fi", text: "Не подключено", needSwitch: false, notifyCount: 0),
          Model(image: (UIImage(named: "bluetooth")?.resizeImage(25, 25))!, name: "Bluetooth", text: "Вкл.", needSwitch: false, notifyCount: 0),
          Model(image: (UIImage(named: "cellular")?.resizeImage(25, 25))!, name: "Сотовая связь", text: nil, needSwitch: false, notifyCount: 0),
          Model(image: (UIImage(named: "hotspot")?.resizeImage(25, 25))!, name: "Режим модема", text: nil, needSwitch: false, notifyCount: 0),
          Model(image: (UIImage(named: "vpn")?.resizeImage(25, 25))!, name: "VPN", text: nil, needSwitch: true, notifyCount: 0)],
         [Model(image: (UIImage(named: "notify")?.resizeImage(25, 25))!, name: "Уведомления", text: nil, needSwitch: false, notifyCount: 0),
          Model(image: (UIImage(named: "speaker")?.resizeImage(25, 25))!, name: "Звуки, тактильные сигналы", text: nil, needSwitch: false, notifyCount: 0),
          Model(image: (UIImage(named: "moon")?.resizeImage(25, 25))!, name: "Не беспокоить", text: nil, needSwitch: false, notifyCount: 0),
          Model(image: (UIImage(named: "hourglass")?.resizeImage(25, 25))!, name: "Экранное время", text: nil, needSwitch: false, notifyCount: 0)],
         [Model(image: (UIImage(named: "gear")?.resizeImage(25, 25))!, name: "Основные", text: nil, needSwitch: false, notifyCount: 1),
          Model(image: (UIImage(named: "switch")?.resizeImage(25, 25))!, name: "Пункт управления", text: nil, needSwitch: false, notifyCount: 0),
          Model(image: (UIImage(named: "aA")?.resizeImage(25, 25))!, name: "Экран и яркость", text: nil, needSwitch: false, notifyCount: 0),
          Model(image: (UIImage(named: "home")?.resizeImage(25, 25))!, name: "Экран \"Домой\"", text: nil, needSwitch: false, notifyCount: 0),
          Model(image: (UIImage(named: "accessability")?.resizeImage(25, 25))!, name: "Универсальный доступ", text: nil, needSwitch: false, notifyCount: 0),]
        ]
    }
}
