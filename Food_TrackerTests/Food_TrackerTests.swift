//
//  Food_TrackerTests.swift
//  Food_TrackerTests
//
//  Created by Ilja Patrushev on 16.9.2020.
//  Copyright © 2020 Ilja Patrushev. All rights reserved.
//

import XCTest
@testable import Food_Tracker

class Food_TrackerTests: XCTestCase {

    //MARK: Meal Class Tests
    
    // Confirm that the Meal Init return a Meal object when passed valid params
    
    func testMealInitializationSucceedsa(){
        
        // Zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // Highest positive rating
        let positiveRatingMeal = Meal.init(name:"Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    // Confirm that Meal init returns nil
    
    func testMealInitializationFails(){
        
        // Negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -2)
        XCTAssertNil(negativeRatingMeal)
        
        // Rating exceeds maximum
        let largeRaingMeal = Meal.init(name: "Overrating", photo: nil, rating: 67)
        XCTAssertNil(largeRaingMeal)
        
        // HEmpty name
        let emptyStringMeal = Meal.init(name:"", photo: nil, rating: 5)
        XCTAssertNil(emptyStringMeal)
        
    }
}
