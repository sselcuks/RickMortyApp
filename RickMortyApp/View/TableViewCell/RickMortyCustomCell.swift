//
//  RickMortyCustomCell.swift
//  RickMortyApp
//
//  Created by Selcuk on 9.02.2022.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

// Create tableview customcell with snapkit

class RickMortyCustomCell: UITableViewCell{
    
    var myCell: Result?{
        didSet{
            name.text = "Name: \(myCell!.name)"
            location.text = "Location: \(myCell!.location!.name)"
            myImage.setImage(imageUrl: myCell!.image)
            id.text = "#Id: \(myCell!.id)"
        }
    }
    
    
    private let myImage: UIImageView = UIImageView()
    private let name: UILabel = UILabel()
    private let location: UILabel = UILabel()
    private let id: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          setUpView()
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // cell view properties
    func setUpView(){
        addSubview(myImage)
        addSubview(name)
        addSubview(location)
        addSubview(id)
        
        myImage.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.width.equalTo(150)
            make.top.equalTo(contentView)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        id.snp.makeConstraints { make in
            make.top.equalTo(myImage.snp.bottom).offset(15)
            make.right.equalTo(contentView)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(myImage.snp.bottom).offset(12)
            make.right.left.equalTo(contentView)
            
        }
        location.snp.makeConstraints { make in
            make.top.equalTo(name).offset(10)
            make.right.left.equalTo(name)
            make.bottom.equalToSuperview()
        }
    }
    
}
