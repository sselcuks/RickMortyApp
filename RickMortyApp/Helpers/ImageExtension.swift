//
//  ImageExtension.swift
//  RickMortyApp
//
//  Created by Selcuk on 9.02.2022.
//

import Foundation
import UIKit

extension UIImageView{
    func setImage(imageUrl:String){
        self.kf.setImage(with: URL(string: imageUrl))
    }
}
