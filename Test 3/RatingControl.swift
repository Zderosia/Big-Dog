//
//  RatingControl.swift
//  Test 3
//
//  Created by De Rosia, Zachary on 5/27/20.
//  Copyright © 2020 De Rosia, Zachary. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    private var ratingButtons = [UIButton]()
     
    var rating = 0

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame);
        setupButtons();
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder);
        setupButtons();
    }
    
    // MARK: Private Methods
    
    private func setupButtons() {
        
        for _ in 0..<5 {
            // Create the button
            let button = UIButton();
            button.backgroundColor = UIColor.red;
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false;
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true;
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true;
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside);
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button);
        }
    }
    @objc func ratingButtonTapped(button: UIButton)
    {
        print ("Button Pressed");
    }
}
