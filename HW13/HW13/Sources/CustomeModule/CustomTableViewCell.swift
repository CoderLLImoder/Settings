//
//  CustomTableViewCell.swift
//  HW13
//
//  Created by Илья Капёрский on 04.09.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let id = "CustomCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var setting: Setting? {
        didSet {
            textLabel?.text = setting?.name
            iconView.image = setting?.image
            let notifyCount = setting?.notifyCount
            notifyView.image = notifyCount! > 0 ? UIImage(systemName: "\(notifyCount!).circle.fill") : nil
            switchButton.isHidden = !(setting?.needSwitch)!
        }
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = textLabel?.text
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.layer.cornerRadius = 5
        iconView.clipsToBounds = true
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    private lazy var notifyView: UIImageView = {
        let notifyView = UIImageView()
        notifyView.tintColor = .red
        notifyView.translatesAutoresizingMaskIntoConstraints = false
        return notifyView
    }()
    
    private lazy var switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.setOn(true, animated: false)
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        return switchButton
    }()
    
    
    private func setupHierarchy() {
        self.addSubview(iconView)
        self.addSubview(label)
        contentView.addSubview(notifyView)
        contentView.addSubview(switchButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            label.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 15),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            notifyView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -50),
            notifyView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            notifyView.widthAnchor.constraint(equalToConstant: 25),
            notifyView.heightAnchor.constraint(equalToConstant: 25),
            
            switchButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            switchButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
    }
}
