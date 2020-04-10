import Foundation
import UIKit

/// View to choose the activity
public class SelectActivityView: UIView {
    
    //MARK:- Properties
    private let buttonsType : [Activity] = [.cut, .nail, .glue]
    private(set) var buttons : [ActivityButton] = []
    
    //MARK:- Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        createBackground()
        createButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Methods
    func animateButtons() {
        buttons.forEach({
            $0.runAnimation()
        })
    }
}

//MARK:- Create View Components
private extension SelectActivityView {
    
    func createBackground() {
        
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        backgroundImage.image = UIImage(named: "Background_Initial")
        backgroundImage.contentMode = .scaleToFill
 
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    
    /// Create all buttons in view.
    func createButtons() {
        
        let sizeButton = CGSize(width: self.frame.height 
            * 0.4, height: self.frame.height 
                * 0.4)
        
        for type in buttonsType {
            let newButton = ActivityButton(frame: CGRect(origin: .zero, size: sizeButton))
            newButton.type = type
            self.buttons.append(newButton)
        }
        
        putButtonsInView()
    }
    
    
    /// All buttons in view
    func putButtonsInView() {
        
        let horizontalStackView = UIStackView(arrangedSubviews: buttons)
        
        horizontalStackView.spacing = 50
        horizontalStackView.alignment = .fill
        horizontalStackView.axis = .horizontal
        horizontalStackView.transform = horizontalStackView.transform.rotated(by: -(.pi/6))
        
        self.addSubview(horizontalStackView)
        
        NSLayoutConstraint.activate([
            horizontalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            horizontalStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 60)
        ])
        
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}



