//
//  EmployeeCell.swift
//  EmployeeDirectory
//
//  Created by Yaz Burrell on 9/9/22.
//

import UIKit

class EmployeeCell: UICollectionViewCell {
// MARK: - Properties
    
    var employees: Employees?
    
    lazy var employeeImageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 100, height: 100)
        iv.layer.cornerRadius = 100 / 2
        iv.backgroundColor = .black
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "First Name, Last Name"
        label.setDimensions(width: 200, height: 20)
        label.textAlignment = .center
        label.backgroundColor = .blue
        return label
    }()
    
    lazy var jobTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "Job Title"
        label.setDimensions(width: 200, height: 20)
        label.textAlignment = .center
        label.backgroundColor = .blue
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
        backgroundColor = .red
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func configure() {
        addSubview(employeeImageView)
         employeeImageView.center(inView: self, yConstant: -48)
        
        let stack = UIStackView(arrangedSubviews: [nameLabel, jobTitleLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        
        addSubview(stack)
         stack.center(inView: employeeImageView, yConstant: 100)
         
    }
    
    
}
