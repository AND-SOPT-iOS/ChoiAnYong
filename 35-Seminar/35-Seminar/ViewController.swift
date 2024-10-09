//
//  ViewController.swift
//  35-Seminar
//
//  Created by 최안용 on 10/8/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    private let imageView: UIImageView = {
        guard let image = UIImage(named: "Netflix") else { return UIImageView() }
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목을 입력해주세요."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14)
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        return textView
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("열기", for: .normal)
        button.layer.cornerRadius = 17
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var pushModeToggleButton: UIButton = {
        let button = UIButton()
        button.setTitle("전환 모드 변경", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var pushMode = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
        updateUI()
    }
    
    private func setUI() {
        view.addSubViews(imageView,
                         titleLabel,
                         titleTextField,
                         contentTextView,
                         nextButton,
                         pushModeToggleButton)
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate(
            [
                imageView.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 20
                ),
                imageView.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                imageView.heightAnchor.constraint(equalToConstant: 100),
                imageView.widthAnchor.constraint(equalToConstant: 100),
                
                titleLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 20
                ),
                titleLabel.leadingAnchor.constraint(
                    equalTo: imageView.trailingAnchor,
                    constant: 15
                ),
                
                nextButton.bottomAnchor.constraint(
                    equalTo: imageView.bottomAnchor
                ),
                nextButton.leadingAnchor.constraint(
                    equalTo: imageView.trailingAnchor,
                    constant: 15
                ),
                nextButton.heightAnchor.constraint(equalToConstant: 35),
                nextButton.widthAnchor.constraint(equalToConstant: 80),
                
                titleTextField.topAnchor.constraint(
                    equalTo: imageView.bottomAnchor,
                    constant: 20
                ),
                titleTextField.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                titleTextField.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                titleTextField.heightAnchor.constraint(equalToConstant: 40),
                
                contentTextView.topAnchor.constraint(
                    equalTo: titleTextField.bottomAnchor,
                    constant: 20
                ),
                contentTextView.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                contentTextView.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                contentTextView.heightAnchor.constraint(
                    equalToConstant: 200
                ),
                                                
                pushModeToggleButton.topAnchor.constraint(
                    equalTo: contentTextView.bottomAnchor,
                    constant: 20
                ),
                pushModeToggleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                pushModeToggleButton.heightAnchor.constraint(equalToConstant: 44),
                pushModeToggleButton.widthAnchor.constraint(equalToConstant: 300),
            ]
        )
    }
    
    private func updateUI() {
        self.titleLabel.text = pushMode ? "네비게이션" : "모달"
    }
    
    @objc func nextButtonTapped() {
        transitionToNextViewController()
    }
    
    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        guard let title = titleTextField.text,
              let content = contentTextView.text
        else {
            return
        }
        
        nextViewController.dataBind(
            title: title,
            content: content
        )
        if pushMode {
            self.navigationController?.pushViewController(
                nextViewController,
                animated: true
            )
        } else {
            self.present(
                nextViewController,
                animated: true
            )
        }
    }
    
    @objc func toggleButtonTapped() {
        self.pushMode.toggle()
        self.updateUI()
    }
}
#Preview {
    ViewController().toPreView()
}
