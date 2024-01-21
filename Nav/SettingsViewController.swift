//
//  SettingsViewController.swift
//  Nav
//
//  Created by Shakir Kadirov on 20.01.2024.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var delegate: ViewControllerDelegate?
    
    lazy var secondViewTbl: UITableView = {
        $0.addSubview(topLabel)
        $0.addSubview(backgroundSquareView)
        return $0
    }(UITableView(frame: view.frame))
    
    lazy var topLabel: UILabel = {
        $0.text = "Введите новые данные"
        $0.numberOfLines = 0
        return $0
    }(UILabel(frame: CGRect(x: 31, y: 100, width: view.frame.width - 62, height: 19)))
    
    
    lazy var nameTextField: UITextField = {
        $0.placeholder = "Имя"
        $0.backgroundColor = .white
        $0.leftView = ofsetView()
        $0.leftViewMode = .always
        $0.layer.cornerRadius = 25
        return $0
    }(UITextField())
    
    lazy var surNameTextField: UITextField = {
        $0.placeholder = "Фамилия"
        $0.backgroundColor = .white
        $0.leftView = ofsetView()
        $0.leftViewMode = .always
        $0.layer.cornerRadius = 25
        return $0
    }(UITextField())
    
    lazy var textFieldStack: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 10
        $0.addArrangedSubview(nameTextField)
        $0.addArrangedSubview(surNameTextField)
       return $0
    }(UIStackView(frame: CGRect(x: 10, y: 20, width: backgroundSquareView.frame.width - 20, height: 134)))
    
    lazy var backgroundSquareView: UIView = {
        $0.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        $0.layer.cornerRadius = 25
        return $0
    }(UIView(frame: CGRect(x: 31, y: topLabel.frame.height + 150, width: view.frame.width - 62, height: 252 )))
    
    
    lazy var saveButton: UIButton = {
        $0.setTitle("Сохранить", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 25
        return $0
    }(UIButton(frame: CGRect(x: 10, y: textFieldStack.frame.origin.y + 164, width: backgroundSquareView.frame.width - 20 , height: 54), primaryAction: saveBtnAction))
    
    lazy var saveBtnAction = UIAction { _ in
        let name = self.nameTextField.text ?? ""
        let surName = self.surNameTextField.text ?? ""
        self.delegate?.setName(nameLbl: name, surNameLbl: surName)
        print("Save")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Настройки"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(secondViewTbl)
        backgroundSquareView.addSubview(textFieldStack)
        backgroundSquareView.addSubview(saveButton)
    }
    func ofsetView() ->UIView{
        let ofsetView = UIView()
        ofsetView.frame = CGRect(x: 0, y: 0, width: 20, height: 54)
        return ofsetView
    }
    
}
