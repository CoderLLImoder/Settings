//
//  SettingsView.swift
//  HW13
//
//  Created by Илья Капёрский on 23.09.2023.
//

import UIKit

final class SettingView: UIView {
    
    func configureView(with model: [[Model]], _ vc: SettingsController) {
        self.model = model
        self.vc = vc
        tableView.reloadData()
    }
    
    private lazy var model = [[Model]]()
    
    private lazy var vc = SettingsController()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.id)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
}

extension SettingView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model[section].count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let cell = tableView.cellForRow(at: indexPath)
        print(cell?.textLabel?.text ?? "")
        if (cell?.textLabel?.text == "Bluetooth")
        {
            detailVC.isOn = cell?.detailTextLabel?.text == "Вкл."
            vc.changeViewController(detailVC)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let setting = model[indexPath.section][indexPath.row]
        
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
    
    func createDefaultCellbySetting(_ setting: Model) -> UITableViewCell{
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
