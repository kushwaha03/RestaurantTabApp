//
//  RestaurantDetailsViewController.swift
//  Rocket
//
//  Created by kashee kushwaha on 04/06/20.
//  Copyright © 2020 kashee kushwaha. All rights reserved.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
//    @IBOutlet weak var bgIMG: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var catLbl: UILabel!
        @IBOutlet weak var addressLbl: UILabel!
    
        @IBOutlet weak var mobNoLbl: UILabel!
    
        @IBOutlet weak var twitterLbl: UILabel!
    @IBOutlet var imageView: UIImageView!
    var Restaurents = [Restaurant]()
    var indtag = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Lunch Tyme";
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.262745098, green: 0.9098039216, blue: 0.5843137255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.white,
         NSAttributedString.Key.font: UIFont(name: "Avenir Next Demi Bold", size: 24)!]
        addressLbl.font = UIFont(name: "Avenir Next Demi Bold", size: 26)
        mobNoLbl.font = UIFont(name: "Avenir Next Demi Bold", size: 24)
        twitterLbl.font = UIFont(name: "Avenir Next Demi Bold", size: 22)

        print(Restaurents[indtag].name)
        print(Restaurents[indtag].category)
        titleLbl.text = Restaurents[indtag].name
        catLbl.text = Restaurents[indtag].category
        let location = Restaurents[indtag].location
        let contact = Restaurents[indtag].contact

        addressLbl.text = location.address
        mobNoLbl.text = contact?.formattedPhone
        twitterLbl.text = "@" + (contact?.twitter ?? "")

//        print(Restaurents[indtag].name)

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
