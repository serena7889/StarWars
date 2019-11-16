//
//  TitleCell.swift
//  StarWars
//
//  Created by Serena Lambert on 16/11/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import UIKit

class TitleCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    func configureCell(title: String) {
        selectionStyle = .none
        nameLbl.text = title
    }

}
