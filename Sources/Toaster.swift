import UIKit

public class Toaster {
    
    // MARK: - Properties
    
    private let serialQueue = DispatchQueue(label: "com.swiftyToaster.serialQueue")
    private var toastQueue: [Toast] = []
    private var isShowing: Bool = false
    
    // MARK: - UI Components
    
    private lazy var window: UIWindow? = {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            print("Error: No window scene found.")
            return nil
        }
        let window = UIWindow(windowScene: windowScene)
        window.windowLevel = .alert
        window.isUserInteractionEnabled = false
        window.backgroundColor = .clear
        window.addSubview(backView)
        window.isHidden = true
        return window
    }()
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .label.withAlphaComponent(0.6)
        view.layer.cornerRadius = SwiftyToasterType.square.cornerRadius
        view.addSubview(messageLabel)
        return view
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: 13)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initializer
    
    public static let shared = Toaster() // Singleton instance
    
    private init() {
        setupLayout()
    }
    
    // MARK: - Setup Layout
    
    private func setupLayout() {
        guard let window = window else {
            print("Error: UIWindow setup failed.")
            return
        }
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // backView의 최대 너비 설정
            backView.widthAnchor.constraint(lessThanOrEqualTo: window.widthAnchor, multiplier: 0.8),
            // 높이는 메시지에 따라 조정
            backView.heightAnchor.constraint(equalTo: messageLabel.heightAnchor, constant: 15),
            backView.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            backView.bottomAnchor.constraint(equalTo: window.bottomAnchor, constant: -80),
            
            // messageLabel의 constraints 업데이트
            messageLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
            messageLabel.centerYAnchor.constraint(equalTo: backView.centerYAnchor)
        ])
    }
    
    public func setToastType(_ type: SwiftyToasterType) {
        backView.layer.cornerRadius = type.cornerRadius
    }
    
    // MARK: - Make Toast !!! 🍞
    
    public func makeToast(_ message: String, _ duration: SwiftyToasterDuration = .middle) {
        serialQueue.async {
            self.toastQueue.append(Toast(message: message, duration: duration))
            self.showNextMessage()
        }
    }
    
    private func showNextMessage() {
        serialQueue.async {
            guard !self.isShowing, !self.toastQueue.isEmpty else {
                return
            }
            self.isShowing = true
            
            DispatchQueue.main.async {
                guard let window = self.window else {
                    print("Error: UIWindow not available.")
                    return
                }
                let toast = self.toastQueue.removeFirst()
                self.messageLabel.text = toast.message
                
                window.isHidden = false
                window.layoutIfNeeded()
                
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                    window.alpha = 1.0
                }) { _ in
                    UIView.animate(withDuration: 0.3, delay: toast.duration.timeInterval, options: .curveEaseIn, animations: {
                        window.alpha = 0.0
                    }) { _ in
                        window.isHidden = true
                        self.serialQueue.async {
                            self.isShowing = false
                            self.showNextMessage()
                        }
                    }
                }
            }
        }
    }
    
}
