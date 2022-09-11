//
//  EmployeeCell.swift
//  EmployeeDirectory
//
//  Created by Yaz Burrell on 9/9/22.
//

import UIKit
import Kingfisher

//protocol EmployeeCellDelegate: AnyObject {
//    func handleEmployeeImageTapped( _ cell: EmployeeCell)
//}

class EmployeeCell: UICollectionViewCell {
    
// MARK: - Properties
    
    var employee: Employee?
    
    //weak var delegate: EmployeeCellDelegate?
    
    lazy var shadowView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 10
        
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: 10).cgPath
        return view
    }()
    
    lazy var employeeImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 100, height: 100)
        iv.layer.cornerRadius = 100 / 2
        iv.backgroundColor = .lightGray
        iv.layer.borderColor = UIColor.lightGray.cgColor
        iv.layer.borderWidth = 0.5
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = "First Name, Last Name"
        label.setDimensions(width: 200, height: 20)
        label.textAlignment = .center
        return label
    }()
    
    lazy var jobTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.text = "Job Title"
        label.setDimensions(width: 200, height: 20)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: - Layout
    
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
    
    func populate(with image: Employee) {
        if let urlToImage = image.photo_url_small {
            let url = URL(string: urlToImage)
            employeeImageView.kf.setImage(with: url)
        }
    }
}
