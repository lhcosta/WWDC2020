//
//  SelectActivityViewController.swift
//  WWDC
//
//  Created by Lucas Costa  on 26/03/20.
//  Copyright © 2020 LucasCosta. All rights reserved.
//

import UIKit

public class SelectActivityViewController: UIViewController {

    //MARK:- Properties
    var selectView : SelectActivityView! {
        didSet {
            self.view = selectView
        }
    }
    
    var coordinator : Coordinator?
    
    //MARK:- View lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()      
        addActionInButtons()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.selectView.animateButtons()
    }
    
}

//MARK:- Private methods
private extension SelectActivityViewController {
    
    func addActionInButtons() {
        selectView.buttons.forEach {
            $0.addTarget(self, action: #selector(startActivity(sender:)), for: .touchUpInside)
        }
    }
    
}

//MARK:- Actions
extension SelectActivityViewController {
    
    /// Start activity according the selected button.
    /// - Parameter sender: selected button.
    @objc func startActivity(sender : ActivityButton) {
        coordinator?.presentScene(type: sender.type)
    }
    
}
