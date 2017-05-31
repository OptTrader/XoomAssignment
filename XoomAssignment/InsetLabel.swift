//
//  InsetLabel.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/30/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import UIKit

class InsetLabel: UILabel {
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)))
    }
}
