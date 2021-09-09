//
//  LoginFormController.swift
//  VkClientNew
//
//  Created by Polina Shevchenko on 01/08/2021.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var titleLogin: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addGestureRecognizer(UITapGestureRecognizer(
                                            target: self, action: #selector(hideKeyboard)))
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if isValid() {
            print("Login")
            performSegue(
                withIdentifier: "loginSegue",
                sender: nil)
        } else {
            showAlert()
        }
    }
    
    
    private func showAlert() {
        let alertController = UIAlertController(
            title: "Error",
            message: "Incorrect username or password",
            preferredStyle: .alert)
        let alertItem = UIAlertAction(
            title: "Ok:(",
            style: .cancel)
        { _ in
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        }
        alertController.addAction(alertItem)
        present(alertController,
                animated: true,
                completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loginSegue" {
            return isValid()
        } else {
            return false
        }
    }
    
    @objc private func keyboardWasShown (notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .required
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .defaultHigh
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .defaultHigh
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .required
            self.view.layoutIfNeeded()
        }
    }

    @objc private func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    func isValid() -> Bool {
        if loginTextField.text == "1"
            && passwordTextField.text == "1" {
            return true
        } else {
            return false
        }
    }
    
    private func setViews() {
        loginLabel.text = "Login"
        passwordLabel.text = "Password"
        
        loginButton.setTitle("Log in", for: .normal)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
    }
}
