import UIKit
class PhoneViewController: UIViewController {
  //MARK: - Outlets
    @IBOutlet var signInButton: Button!
    @IBOutlet var phoneTextView: UITextView!
    //MARK: - viewDidLoad settings
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        phoneTextView.delegate = self
        setNotification()
    }
    //MARK: - Helping Functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.phoneTextView.resignFirstResponder()
    }
    //MARK: - signInButtonTapped
    @IBAction func signInButtonTapped(_ sender: Any) {
        navControllerPresentNextVC(withIdentifire: "CodeViewController")
    }
}
//MARK: -  UITextViewDelegate extension
extension PhoneViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor != .white {
            textView.text = "+7 "
            textView.textColor = .white
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        guard var text = textView.text else { return }
        switch text.count {
        case 4: let index = text.index(text.startIndex, offsetBy: 3)
            if text[index] != "(" {
                text.insert("(", at: index)
            }
        case 8: var index = text.index(text.startIndex, offsetBy: 7)
            if text[index] != ")" {
                text.insert(")", at: index)
                index = text.index(after: index)
                text.insert(" ", at: index)
            }
        case 13: let index = text.index(text.startIndex, offsetBy: 12)
            if text[index] != "-" {
                text.insert("-", at: index)
            }
        case 16: let index = text.index(text.startIndex, offsetBy: 15)
            if text[index] != "-" {
                text.insert("-", at: index)
            }
        default: break
            
        }
        textView.text = text
        if text.count == 18 {
            signInButton.buttonEnable()
        } else {
            signInButton.buttonDisable()
        }
    }
}
