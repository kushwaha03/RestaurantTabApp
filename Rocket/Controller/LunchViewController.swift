//
//  LunchViewController.swift
//  Rocket
//
//  Created by kashee kushwaha on 03/06/20.
//  Copyright © 2020 kashee kushwaha. All rights reserved.
//

import UIKit

class LunchViewController: UIViewController {
    
    @IBOutlet weak var lunchCollection: UICollectionView!
    
    //    var Restaurents = [RestaurantModel]()
    var RestaurantsList = [[String:Any]]()
    var Restaurents = [Restaurant]()
    
    let messageFrame = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var strLabel = UILabel()
    
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator("Loading...")

        setNav()
        
    }
    
    func activityIndicator(_ title: String) {
        
        strLabel.removeFromSuperview()
        activityIndicator.removeFromSuperview()
        effectView.removeFromSuperview()
        
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 160, height: 46))
        strLabel.text = title
        strLabel.font = .systemFont(ofSize: 14, weight: .medium)
        strLabel.textColor = UIColor(white: 0.9, alpha: 0.7)
        
        effectView.frame = CGRect(x: view.frame.midX - strLabel.frame.width/2, y: view.frame.midY - strLabel.frame.height/2-10 , width: 160, height: 50)
        effectView.layer.cornerRadius = 15
        effectView.layer.masksToBounds = true
        
        activityIndicator = UIActivityIndicatorView(style: .white)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.startAnimating()
        
        effectView.contentView.addSubview(activityIndicator)
        effectView.contentView.addSubview(strLabel)
        view.addSubview(effectView)
    }
    func setNav() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.262745098, green: 0.9098039216, blue: 0.5843137255, alpha: 1)
          self.navigationController?.navigationBar.titleTextAttributes =
              [NSAttributedString.Key.foregroundColor: UIColor.white,
               NSAttributedString.Key.font: UIFont(name: "Avenir Next Demi Bold", size: 24)!]
    }
    override func viewDidAppear(_ animated: Bool) {
        getJSON()
         
    }
    func getJSON(){
        
        guard let gitUrl = URL(string: "https://s3.amazonaws.com/br-codingexams/restaurants.json") else { return }
        
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            
            , error) in
            
            guard let data = data else { return }
            
            
            do {
                
                let decoder = JSONDecoder()
                
                let list = try decoder.decode(RestaurantModel.self, from: data)
                self.Restaurents = list.restaurants
                DispatchQueue.main.async {
                    self.lunchCollection.reloadData()
                }
 
            } catch let err {
                
                print("Err", err)
                
            }
            
        }.resume()
        
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

extension LunchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.Restaurents.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LunchCollViewCell
        
        cell.titleLbl.text = self.Restaurents[indexPath.row].name
        cell.catLbl.text = self.Restaurents[indexPath.row].category
        
        if let image = self.Restaurents[indexPath.row].backgroundImageURL as? String {
            if let url = URL(string: image){
                
                do {
                    let data = try Data(contentsOf: url)
                    self.effectView.removeFromSuperview()

                    cell.bgIMG.image = UIImage(data: data)
                }
                catch let err {
                    print(" Error : \(err.localizedDescription)")
                }
                
                
            }
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("commee")
        
        guard let DetailsV = self.storyboard?.instantiateViewController(identifier: "RestaurantDetailsViewController") as? RestaurantDetailsViewController else { return  }
        //        popupV.modalPresentationStyle = .overCurrentContext
        //
        self.title = ""
        DetailsV.Restaurents = self.Restaurents
        DetailsV.indtag = indexPath.row
        //               popupV.modalTransitionStyle = .crossDissolve
        //                self.present(popupV, animated: true, completion: nil)
        self.navigationController?.pushViewController(DetailsV, animated: true)
    }
}

