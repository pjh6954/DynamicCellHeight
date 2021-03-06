//
//  NotSoGoodDynaTableViewCell.swift
//  DynamicCellHeight
//
//  Created by Don Mag on 3/29/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

protocol NotSoGoodCellDelegate {
	func moreTapped(cell: NotSoGoodDynaTableViewCell)
}


class NotSoGoodDynaTableViewCell: UITableViewCell {

	@IBOutlet weak var labelTitle: UILabel!
	@IBOutlet weak var labelBody: UILabel!
	
	@IBOutlet weak var buttonMore: UIButton!

	var delegate: NotSoGoodCellDelegate?
	
	var isExpanded: Bool = false
	
	@IBAction func btnMoreTapped(_ sender: Any) {
		
		if sender is UIButton {
			isExpanded = !isExpanded
			
			labelBody.numberOfLines = isExpanded ? 0 : 2
			buttonMore.setTitle(isExpanded ? "Read less..." : "Read more...", for: .normal)
			
			delegate?.moreTapped(cell: self)
		}
		
	}
	
	public func myInit(theTitle: String, theBody: String) {
		
		isExpanded = false
		
		labelTitle.text = theTitle
		labelBody.text = theBody
		
		labelBody.numberOfLines = 2
		
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
