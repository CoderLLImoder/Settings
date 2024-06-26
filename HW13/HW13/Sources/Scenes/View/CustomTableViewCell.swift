//
//  CustomTableViewCell.swift
//  HW13
//
//  Created by Илья Капёрский on 04.09.2023.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    static let id = "CustomCell"
    
    private enum CustomConstants: CGFloat {
        case padding15 = 15
        case padding20 = 20
        case padding25 = 25
        case padding50 = 50
        case radius5 = 5
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var setting: Model? {
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
        iconView.layer.cornerRadius = CustomConstants.radius5.rawValue
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
            iconView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CustomConstants.padding20.rawValue),
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            label.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: CustomConstants.padding15.rawValue),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            notifyView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -CustomConstants.padding50.rawValue),
            notifyView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            notifyView.widthAnchor.constraint(equalToConstant: CustomConstants.padding25.rawValue),
            notifyView.heightAnchor.constraint(equalToConstant: CustomConstants.padding25.rawValue),
            
            switchButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -CustomConstants.padding20.rawValue),
            switchButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
    }
}
