import UIKit
extension PhoneViewController {
    func setNotification() {
        signInButton.buttonDisable()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    @objc func keyboardDidShow() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.view.frame.origin = CGPoint(x: 0, y: -((self?.view.bounds.height ?? 10) / 7))
        }
    }
    @objc func keyboardDidHide() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.view.frame.origin = CGPoint(x: 0, y: 0)
        }
    }
}
extension UIViewController {
    func navControllerPresentNextVC(withIdentifire: String) {
        lazy var sb = UIStoryboard(name: "Main", bundle: nil)
        lazy var newVC = sb.instantiateViewController(withIdentifier: withIdentifire)
        self.navigationController?.pushViewController(newVC, animated: true)
    }
}
extension SetProfileViewController {
    func setNotification() {
        continueButton.buttonDisable()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    @objc func keyboardDidShow() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.view.frame.origin = CGPoint(x: 0, y: -(self?.avatarImageView.bounds.height ?? 10))
        }
    }
    @objc func keyboardDidHide() {
        UIView.animate(withDuration: 0.6) { [weak self] in
            self?.view.frame.origin = CGPoint(x: 0, y: 0)
        }
    }
    func showAlert() {
        let alertController = UIAlertController(title: "Set photo?", message: nil, preferredStyle: .actionSheet)
        let photoAction = UIAlertAction(title: "From gallery", style: .default) { [weak self] alertAction in
            self?.imagePicker.sourceType = .photoLibrary
            self?.imagePicker.allowsEditing = true
            self?.present(self?.imagePicker ?? UIViewController(), animated: true)
        }
        let cameraAction = UIAlertAction(title: "Take new photo", style: .default) { [weak self] alertAction in
            self?.imagePicker.sourceType = .camera
            self?.present(self?.imagePicker ?? UIViewController(), animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(photoAction)
        alertController.addAction(cameraAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}

