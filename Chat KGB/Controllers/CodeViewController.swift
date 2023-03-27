import UIKit
class CodeViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet var signInButton: Button!
    @IBOutlet var codeTextView: [UITextView]!
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.buttonDisable()
    }
    //MARK: - Functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        codeTextView.forEach { $0.resignFirstResponder() }
    }
    @IBAction func signInButtonTapped(_ sender: Any) {
        navControllerPresentNextVC(withIdentifire: "SetProfileViewController")
    }
}
//MARK: - extension
extension CodeViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        //codeTextView.first?.becomeFirstResponder()
    }
    func textViewDidChange(_ textView: UITextView) {
        if textView.text != "" {
            textView.resignFirstResponder()
            switch textView.tag {
            case 0: codeTextView[1].becomeFirstResponder()
            case 1: codeTextView[2].becomeFirstResponder()
            case 2: codeTextView[3].becomeFirstResponder()
            case 3: codeTextView[3].resignFirstResponder()
            default:
                break
            }
        }
        if textView.text.count > 1 {
            textView.text.removeLast()
        }
        if codeTextView.filter{ $0.text != "" }.count == 4 {
            signInButton.buttonEnable()
        } else {
            signInButton.buttonDisable()
        }
    }
}
