//
//  Model.swift
//  Coffee Companion
//
//  Created by Matthew Gaddes on 29/12/2015.
//  Copyright © 2015 Matthew Gaddes. All rights reserved.
//

import Foundation
import UIKit // This must be imported to work with UIImage
import CoreData

// Dictionary to hold coffee types
var coffees = [Coffee]()

struct Coffee { // Defines the attributes a coffee must have
    var name: String
    var nameXCDataModel: String
    var intensity: Int
    var size: String
    var aroma: String
    var notes: String
    var quantity: Int
//    var podColour: String // Should this be UIColor?
    var icon: UIImage
    
    init (name: String, nameXCDataModel: String, intensity: Int, size: String, aroma: String, notes: String, quantity: Int, icon: UIImage) {
        self.name = name
        self.nameXCDataModel = nameXCDataModel
        self.intensity = intensity
        self.size = size
        self.aroma = aroma
        self.notes = notes
        self.quantity = quantity
//        self.podColour = podColour
        self.icon = icon
        
        // Populate array with coffee types
        // Each coffee type in this array will have an number associated with it. This number is dependent upon the order in which the coffees are initialised.
        coffees.append(self)
    }
}



class Model
{
    private var dictionary = [String:Coffee]() // Dict to hold coffee types. Key = coffee name.
    
    var intensoArray = [Coffee]()
    var espressoArray = [Coffee]()
    var pureOriginArray = [Coffee]()
    var lungoArray = [Coffee]()
    var decaffeinatoArray = [Coffee]()
    var variationsArray = [Coffee]()
    
    var coffeeNames = [String]()
    var coffeeDetails = [Coffee]()
    
    init () {
        
        // TODO: quantity for all coffees should be 0 when app first loads
        
        // Initialise types of coffee
        // Intenso
        intensoArray.append(Coffee(name: "Arpeggio", nameXCDataModel: "arpeggio", intensity: 9, size: "Espresso (40ml)", aroma: "Intense", notes: "Strong character and intense body, enhanced by cocoa notes", quantity: 15, icon: UIImage(named:"Arpeggio.png")!))
        intensoArray.append(Coffee(name: "Dharkan", nameXCDataModel: "dharkan", intensity: 11, size: "Espresso (40ml)", aroma: "Intense", notes: "Hints of bitter cocoa powder and toasted cereals expressed through a silky and velvety texture", quantity: 7, icon: UIImage(named:"Dharkan.png")!))
        intensoArray.append(Coffee(name: "Kazaar", nameXCDataModel: "kazaar", intensity: 12, size: "Espresso (40ml)", aroma: "Intense", notes: "Powerful bitterness and notes of pepper, balanced by a full and creamy texture", quantity: 7, icon: UIImage(named:"Kazaar.png")!))
        intensoArray.append(Coffee(name: "Ristretto", nameXCDataModel: "ristretto", intensity: 10, size: "Espresso (40ml)", aroma: "Intense", notes: "Full-bodied, intense espresso with a subtle, fruity note", quantity: 13, icon: UIImage(named:"Ristretto.png")!))
        intensoArray.append(Coffee(name: "Roma", nameXCDataModel: "roma", intensity: 8, size: "Espresso (40ml)", aroma: "Intense", notes: "Sweet, woody notes and a full, lasting taste", quantity: 8, icon: UIImage(named:"Roma.png")!))
        
        // Espresso
        espressoArray.append(Coffee(name: "Capriccio", nameXCDataModel: "capriccio", intensity: 5, size: "Espresso (40ml)", aroma: "Balanced", notes: "Rich aroma and a strong typical cereal note", quantity: 10, icon: UIImage(named:"Capriccio.png")!))
        espressoArray.append(Coffee(name: "Cosi", nameXCDataModel: "cosi", intensity: 4, size: "Espresso (40ml)", aroma: "Fruity", notes: "Lightly toasted cereal and fruity notes", quantity: 10, icon: UIImage(named:"Cosi.png")!))
        espressoArray.append(Coffee(name: "Livanto", nameXCDataModel: "livanto", intensity: 6, size: "Espresso (40ml)", aroma: "Balanced", notes: "A well-balanced espresso characterised by a roasted caramalised note", quantity: 10, icon: UIImage(named:"Livanto.png")!))
        espressoArray.append(Coffee(name: "Volluto", nameXCDataModel: "volluto", intensity: 4, size: "Espresso (40ml)", aroma: "Balanced", notes: "Sweet and biscuity flavours", quantity: 7, icon: UIImage(named:"Volluto.png")!))
        
        // Pure Origin
        pureOriginArray.append(Coffee(name: "Indriya from India", nameXCDataModel: "indriya", intensity: 10, size: "Espresso (40ml)", aroma: "Intense", notes: "A full-bodied espresso, which has a distinct personality with notes of spices", quantity: 10, icon: UIImage(named:"Indriya from India.png")!))
        pureOriginArray.append(Coffee(name: "Rosabaya de Colombia", nameXCDataModel: "rosabaya", intensity: 6, size: "Espresso (40ml)", aroma: "Fruity", notes: "This coffee has a subtle acidity with typical red fruit and winey notes", quantity: 9, icon: UIImage(named:"Rosabaya de Colombia.png")!))
        pureOriginArray.append(Coffee(name: "Dulsao do Brasil", nameXCDataModel: "dulsao", intensity: 4, size: "Espresso (40ml)", aroma: "Balanced", notes: "The satiny smooth, elegantly balanced flavor is enhanced with a note of delicately toasted grain", quantity: 8, icon: UIImage(named:"Dulsao do Brasil.png")!))
        pureOriginArray.append(Coffee(name: "Bukeela ka Ethiopia", nameXCDataModel: "bukeela", intensity: 3, size: "Lungo (110ml)", aroma: "Balanced", notes: "This delicately fresh and floral Pure Origin Lungo reveals unexpectedly wild notes of musk and wood", quantity: 10, icon: UIImage(named:"Bukeela ka Ethiopia.png")!))
        
        // Lungo
        lungoArray.append(Coffee(name: "Fortissio Lungo", nameXCDataModel: "fortissioLungo", intensity: 8, size: "Lungo (110ml)", aroma: "Intense", notes: "West Indian Malabar Arabica beans are exposed to monsoon winds after harvest to reveal a distinguished aromatic profile, rich with cereal notes", quantity: 8, icon: UIImage(named:"Fortissio Lungo.png")!))
        lungoArray.append(Coffee(name: "Vivalto Lungo", nameXCDataModel: "vivaltoLungo", intensity: 4, size: "Lungo (110ml)", aroma: "Fruity", notes: "Separately roasted South American and East African Arabicas, combining roasted and subtle floral notes", quantity: 10, icon: UIImage(named:"Vivalto Lungo.png")!))
        lungoArray.append(Coffee(name: "Linizio Lungo", nameXCDataModel: "linizioLungo", intensity: 4, size: "Lungo (110ml)", aroma: "Balanced", notes: "Split-roasting gives a cereal, malty note typical for the Bourbon variety, while maintaining its mild and smooth character", quantity: 15, icon: UIImage(named:"Linizio Lungo.png")!))
        
        // Decaffeinato
        decaffeinatoArray.append(Coffee(name: "Decaffeinato Arpeggio", nameXCDataModel: "arpeggioDecaffeinato", intensity: 9, size: "Espresso (40ml)", aroma: "Intense", notes: "This coffee boasts strong character, intense body and cocoa notes", quantity: 10, icon: UIImage(named:"Decaffeinato Arpeggio.png")!))
        decaffeinatoArray.append(Coffee(name: "Decaffeinato Volluto", nameXCDataModel: "vollutoDecaffeinato", intensity: 4, size: "Espresso (40ml)", aroma: "Fruity", notes: "This coffee reveals sweet and biscuity flavours, reinforced by a hint of acidity and a fruity note", quantity: 9, icon: UIImage(named:"Decaffeinato Volluto.png")!))
        decaffeinatoArray.append(Coffee(name: "Decaffeinato Vivalto Lungo", nameXCDataModel: "vivaltoLungoDecaffeinato", intensity: 4, size: "Lungo (110ml)", aroma: "Fruity", notes: "This coffee perfectly preserves the complexity of separately roasted South American and East African Arabicas, combining both roasted and subtle floral notes", quantity: 10, icon: UIImage(named:"Decaffeinato Vivalto Lungo.png")!))
        decaffeinatoArray.append(Coffee(name: "Decaffeinato Intenso", nameXCDataModel: "intensoDecaffeinato", intensity: 7, size: "Espresso (40ml)", aroma: "Intense", notes: "A full-bodied espresso with subtle cocoa and roasted cereal notes", quantity: 10, icon: UIImage(named:"Decaffeinato Intenso.png")!))
        
        // Variations
        variationsArray.append(Coffee(name: "Ciocattino", nameXCDataModel: "ciocattino", intensity: 6, size: "Espresso (40ml)", aroma: "Chocolate", notes: "Dark and bitter chocolate notes meet the caramelised roast of the Livanto Grand Cru. A rich combination reminiscent of a square of dark chocolate", quantity: 9, icon: UIImage(named:"Ciocattino.png")!))
        variationsArray.append(Coffee(name: "Vanilio", nameXCDataModel: "vanilio", intensity: 6, size: "Espresso (40ml)", aroma: "Vanilla", notes: "A balanced harmony between the rich and the velvety aromas of vanilla and the mellow flavour of the Livanto Grand Cru. A blend distinguished by its full flavour, infinitely smooth and silky on the palate", quantity: 10, icon: UIImage(named:"Vanilio.png")!))
        variationsArray.append(Coffee(name: "Caramelito", nameXCDataModel: "caramelito", intensity: 6, size: "Espresso (40ml)", aroma: "Caramel", notes: "The sweet flavour of caramel softens the roasted notes of the Livanto Grand Cru. This delicate gourmet marriage evokes the creaminess of soft toffee", quantity: 8, icon: UIImage(named:"Caramelito.png")!))
        
        // Populate arrays with names and details
        populateNamesAndDetails(intensoArray)
        populateNamesAndDetails(espressoArray)
        populateNamesAndDetails(pureOriginArray)
        populateNamesAndDetails(lungoArray)
        populateNamesAndDetails(decaffeinatoArray)
        populateNamesAndDetails(variationsArray)
        
//        for (key, value) in dictionary {
//            coffeeNames.append(key)
//            coffeeDetails.append(value)
//        }
    }
    
    func populateNamesAndDetails(inputArray: [Coffee]) {
        
        // Populate 2No. arrays
        // One will hold the name of each coffee, in order
        // One will hold all other data, in order
        // These arrays can then be accessed using subscript syntax
        
        for item in inputArray {
            coffeeNames.append(item.name)
            coffeeDetails.append(item)
        }
    }
}





