//
//  FilterPopUp.swift
//  RickMortyApp
//
//  Created by Selcuk on 9.02.2022.
//

import Foundation
import UIKit

let viewModel = RickMortyViewModel()
class PopUp: NSObject{
    
    class func selectCharacter(view:UIViewController, title: String, message:String){
        let alert = UIAlertController(title: "Info", message: "Choose Character", preferredStyle: UIAlertController.Style.alert)

                // add the actions (buttons)
        
        
       // alert.addAction(UIAlertAction(title: "All", style: UIAlertAction.Style.default, handler: viewModel.rick ))
                
//        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
//            viewModel.getRick(completion: <#T##([Result]?) -> Void#>)
//        }))
        alert.addAction(UIAlertAction(title: "Rick", style: UIAlertAction.Style.cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "Morty", style: UIAlertAction.Style.destructive, handler: nil))

                // show the alert
                view.present(alert, animated: true, completion: nil)
        
    }

}


