//
//  CreateShortLinkViewController.swift
//  ShortIt
//
//  Created by Александр on 13/01/2022.
//

import UIKit

class CreateShortLinkViewController: UIViewController {
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 53/255.0, green: 155/255.0, blue: 220/255.0, alpha: 1)
        view.layer.cornerRadius = 6
        return view
    }()
    
    private lazy var urlTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Enter URL:", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.backgroundColor = UIColor(white: 1, alpha: 0.3)
        textField.textColor = .white
        textField.tintColor = .white
        textField.clearButtonMode = .always
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var shortenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.frame.size.height = 160
        button.setTitle("Shorten!", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(shortURL), for: .touchUpInside)
        return button
    }()
    
    private lazy var openUrlButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("URL", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(showInformation), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Short It!"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupSubViews(backgroundView, urlTextField, shortenButton, openUrlButton)
        
        setBackgroundViewConstraints()
        setTextFieldConstraints()
        setOpenUrlButtonConstraints()
        setShortenButtonConstraints()
    }
    
    private func setupSubViews(_ subViews: UIView...) {
        subViews.forEach { subView in
            view.addSubview(subView)
        }
    }
    
    private func saveLink(_ responce: Responce) {
        StorageManager.shared.saveResponce(responce)
    }
    
    
    @objc private func shortURL() {
        guard let text = urlTextField.text else { return }
        let apiURL = NetworkManager.shared.api+text
        
        NetworkManager.shared.fetchData(with: apiURL) { [weak self] result in
            switch result {
            case .success(let responce):
                self?.openUrlButton.setTitle(responce.shortUrl, for: .normal)
                self?.saveLink(responce)
            case .failure(let error):
                print(error)
            }
        }
        
        UIView.animate(withDuration: 0.3) {
            self.shortenButton.alpha = 0.7
            self.shortenButton.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        } completion: { [unowned self] (_) in
            self.shortenButton.transform = CGAffineTransform.identity
            self.shortenButton.alpha = 1.0
        }
    }
    
    @objc private func showInformation() {
        let webViewVC = WebViewController()
        guard let stringURL = openUrlButton.titleLabel?.text, let url = URL(string: stringURL) else { return }
        webViewVC.url = url
        present(webViewVC, animated: true, completion: nil)
    }
}

// MARK: - Setup UIElements Constraints
extension CreateShortLinkViewController {
    private func setBackgroundViewConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backgroundView.bottomAnchor.constraint(equalTo: shortenButton.bottomAnchor, constant: 20)
        ])
    }
    
    private func setTextFieldConstraints() {
        NSLayoutConstraint.activate([
            urlTextField.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            urlTextField.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            urlTextField.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10)
        ])
    }
    
    private func setOpenUrlButtonConstraints() {
        NSLayoutConstraint.activate([
            openUrlButton.topAnchor.constraint(equalTo: urlTextField.bottomAnchor, constant: 20),
            openUrlButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            openUrlButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10)
        ])
    }
    
    private func setShortenButtonConstraints() {
        NSLayoutConstraint.activate([
            shortenButton.topAnchor.constraint(equalTo: openUrlButton.bottomAnchor, constant: 20),
            shortenButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 100),
            shortenButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -100)
        ])
    }
}
