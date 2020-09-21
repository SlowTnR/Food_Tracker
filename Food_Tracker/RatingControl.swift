//
//  RatingControl.swift
//  Food_Tracker
//
//  Created by Ilja Patrushev on 21.9.2020.
//  Copyright © 2020 Ilja Patrushev. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

   //MARK: Initialization
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton){
        print("Button pressed...")
    }
    //MARK: Private Methods
    
    private func setupButtons(){
        // Create button
        
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        // Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        // Add action to button
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        
        // Add button to the stack
        
        addArrangedSubview(button)
    }
}
