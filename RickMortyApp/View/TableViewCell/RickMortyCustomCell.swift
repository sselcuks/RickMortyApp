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

class RickMortyCustomCell: UITableViewCell{
    
    var myCell: Result?{
        didSet{
            name.text = myCell?.name
            location.text = myCell?.location?.name
            myImage.setImage(imageUrl: myCell!.image)
            id.text = myCell?.id
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
    
    func setUpView(){
        addSubview(myImage)
        addSubview(name)
        addSubview(location)
        addSubview(id)
        
        myImage.snp.makeConstraints { make in
            make.height.equalTo(160)
            make.top.equalTo(contentView)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        id.snp.makeConstraints { make in
            make.top.equalTo(myImage.snp.bottom).offset(10)
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
