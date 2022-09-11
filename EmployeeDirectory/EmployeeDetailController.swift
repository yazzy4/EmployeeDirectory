//
//  EmployeeDetailController.swift
//  EmployeeDirectory
//
//  Created by Yaz Burrell on 9/11/22.
//

import UIKit

private let reuseIdentifier = "EmployeeCell"

class EmployeeDetailController: UICollectionViewController {
    
    // MARK: - Properties
    private let employee: Employee
    
    // MARK: - Lifecycle
    
    init(employee: Employee){
        self.employee = employee
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        
        view.backgroundColor = .red

    }
    
    func configureCollectionView() {
        self.collectionView!.register(EmployeeCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
   
        return cell
    }


}
