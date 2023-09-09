//
//  DetailViewController.swift
//  HW13
//
//  Created by Илья Капёрский on 07.09.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    enum CustomConstraints: CGFloat {
        case padding10 = 10
        case padding20 = 20
        case padding40 = 40
    }
    
    public var isOn = false
    
    private lazy var rect: UIView = {
        let rect = UIView()
        rect.layer.cornerRadius = 10
        rect.backgroundColor = .systemFill
        rect.clipsToBounds = true
        rect.translatesAutoresizingMaskIntoConstraints = false
        return rect
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "Bluetooth"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.setOn(isOn, animated: false)
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        return switchButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Bluetooth"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
    }
    
    //MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(rect)
        view.addSubview(label)
        view.addSubview(switchButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            rect.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CustomConstraints.padding20.rawValue),
            rect.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CustomConstraints.padding10.rawValue),
            rect.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -CustomConstraints.padding20.rawValue),
            rect.heightAnchor.constraint(equalToConstant: CustomConstraints.padding40.rawValue),
            
            label.leftAnchor.constraint(equalTo: rect.leftAnchor, constant: CustomConstraints.padding40.rawValue),
            label.centerYAnchor.constraint(equalTo: rect.centerYAnchor),
            
            switchButton.rightAnchor.constraint(equalTo: rect.rightAnchor, constant: -CustomConstraints.padding20.rawValue),
            switchButton.centerYAnchor.constraint(equalTo: rect.centerYAnchor)
            ])
        
    }
}
