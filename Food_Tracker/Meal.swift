//
//  Meal.swift
//  Food_Tracker
//
//  Created by Ilja Patrushev on 24.9.2020.
//  Copyright © 2020 Ilja Patrushev. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Props
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Init
    init?(name: String, photo: UIImage?, rating: Int){
        // Init check
        // The name must not be empty
        
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
    
        
        // Init stored props
        
        self.name = name
        self.photo = photo
        self.rating = rating
        
        
    }
}
