//
//  ViewController.swift
//  Nav
//
//  Created by Shakir Kadirov on 20.01.2024.
//

import UIKit

protocol ViewControllerDelegate{
    func setName(nameLbl: String, surNameLbl: String)
    
}

class MainViewController: UIViewController, ViewControllerDelegate, SettingsViewControllerDelegate {
    func didSaveSettings(name: String, surname: String) {
        nameLbl.text = name
        surNameLbl.text = surname
    }
    
    func setName(nameLbl: String, surNameLbl: String) {
        self.nameLbl.text = nameLbl
        self.surNameLbl.text = surNameLbl
    }
    
    lazy var mainTableView: UITableView = {
        $0.addSubview(profileImg)
        $0.addSubview(labelStack)
        $0.addSubview(settingsButton)
        $0.addSubview(middleStack)
        $0.addSubview(contantImageView)
        return $0
    }(UITableView(frame: view.frame))
    
    lazy var profileImg: UIImageView = {
        $0.image = UIImage(named: "mountainImage.jpg")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = $0.frame.height / 2
        return $0
    }(UIImageView(frame: CGRect(x: view.center.x - 50, y: 0, width: 100, height: 100)))
    
    lazy var labelStack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 20
        $0.alignment = .center
        $0.addArrangedSubview(nameLbl)
        $0.addArrangedSubview(surNameLbl)
        return $0
    }(UIStackView(frame: CGRect(x: view.center.x - 100, y: profileImg.frame.origin.y + 120, width: profileImg.frame.width + 100, height: 20)))

    lazy var nameLbl: UILabel = {
        $0.text = "Имя"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        return $0
    }(UILabel())
    
    lazy var surNameLbl: UILabel = {
        $0.text = "Фамилия"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        return $0
    }(UILabel())
    
    lazy var settingsButton: UIButton = {
        $0.setTitle("Настройки", for:.normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.layer.cornerRadius = 25
        return $0
    }(UIButton(frame: CGRect(x: view.center.x - 50 , y: labelStack.frame.origin.y + 50, width: 100, height: 25),primaryAction: openSettings))
    
    lazy var middleStack: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.spacing = 20
        $0.addArrangedSubview(friendView)
        $0.addArrangedSubview(followingView)
        $0.addArrangedSubview(favoriteView)
        return $0
    }(UIStackView(frame: CGRect(x: 31, y: settingsButton.frame.origin.y + 50, width: view.frame.width - 62, height: 79)))
    
    lazy var friendView: UIView = {
        $0.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        $0.layer.cornerRadius = 15
        return $0
    }(UIView())
    lazy var followingView: UIView = {
        $0.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        $0.layer.cornerRadius = 15
        return $0
    }(UIView())
    lazy var favoriteView: UIView = {
        $0.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        $0.layer.cornerRadius = 15
        return $0
    }(UIView())

    lazy var contantImageView: UIImageView = {
        $0.image = UIImage(named: "mountainImage.jpg")
        $0.layer.cornerRadius = 25
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: CGRect(x: 31, y: settingsButton.frame.origin.y + 150, width: view.frame.width - 62, height: settingsButton.frame.origin.y + 100)))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true

        view.addSubview(middleStack)
        view.addSubview(contantImageView)
        view.addSubview(mainTableView)
    }
    
    lazy var openSettings = UIAction{_ in
        let  navigatioVC = SettingsViewController()
        self.navigationController?.pushViewController(navigatioVC, animated: true)
    }
}

