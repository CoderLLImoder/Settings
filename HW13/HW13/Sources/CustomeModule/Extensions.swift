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

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings[section].count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let cell = tableView.cellForRow(at: indexPath)
        print(cell?.textLabel?.text ?? "")
        if (cell?.textLabel?.text == "Bluetooth")
        {
            detailVC.isOn = cell?.detailTextLabel?.text == "Вкл."
            navigationController?.pushViewController(detailVC, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let setting = settings[indexPath.section][indexPath.row]
        
        if (setting.needSwitch)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.id, for: indexPath) as? CustomTableViewCell
            cell?.setting = setting
            cell?.separatorInset = .init(top: 0, left: 60, bottom: 0, right: 0)
            return cell ?? UITableViewCell()
        }
        
        if (setting.notifyCount > 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.id, for: indexPath) as? CustomTableViewCell
            cell?.setting = setting
            cell?.separatorInset = .init(top: 0, left: 60, bottom: 0, right: 0)
            cell?.accessoryType = .disclosureIndicator
            return cell!
        }
        
        return createDefaultCellbySetting(setting)
    }
    
    func createDefaultCellbySetting(_ setting: Setting) -> UITableViewCell{
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.text = setting.name
        cell.detailTextLabel?.text = setting.text
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = setting.image
        cell.imageView?.layer.cornerRadius = 5
        cell.imageView?.clipsToBounds = true
        return cell
    }
}