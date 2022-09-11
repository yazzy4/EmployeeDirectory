//
//  EmployeeController.swift
//  EmployeeDirectory
//
//  Created by Yaz Burrell on 9/9/22.
//

import Foundation
import UIKit

private let reuseIdentifier = "EmployeeCell"

class EmployeeController: UICollectionViewController {
    
    // MARK: - Properties

    var employees = [Employee]()
    var employeeCell: EmployeeCell?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        
        let urlString = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
        self.collectionView.dataSource = self
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - JSON
    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonEmployees = try? decoder.decode(Employees.self, from: json) {
            employees = jsonEmployees.employees
           collectionView.reloadData()
        }
    }
    
    func configureCollectionView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Staff Directory"
        collectionView.register(EmployeeCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

extension EmployeeController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return employees.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? EmployeeCell else { return UICollectionViewCell() }
        let employee = employees[indexPath.row]
        cell.nameLabel.text = employee.full_name
        cell.jobTitleLabel.text = employee.team
        cell.populate(with: employee)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = EmployeeDetailController(employee: employees[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension EmployeeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        

        return CGSize.init(width: size, height: size)
    }

}

