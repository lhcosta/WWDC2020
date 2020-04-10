import Foundation
import UIKit

class ActivityButton: UIButton {
    
    /// Button type
    var type : Activity! {
        didSet {
            self.setBackgroundImage(UIImage(named: "\(type.rawValue)Button"), for: .normal)
        }
    }
    
    //MARK:- Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Methods
    /// Set all constraints.
    func setConstraints() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: frame.size.width),
            self.heightAnchor.constraint(equalToConstant: frame.size.height)
        ])
    }    
}
