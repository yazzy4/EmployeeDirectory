//
//  ViewController.swift
//  EmployeeDirectory
//
//  Created by Yaz Burrell on 9/7/22.
//

import UIKit

// OBJECTIVE -----------------------------------------------
 /*
  - Build an employee directory app that shows a list of employees from the provided endpoint
  - The app should display a list (or any kind of collection view!) which shows all the employees returned from the JSON endpoint described below.
  - Each item in the view should contain a summary of the employee, including their photo, name and team at minimum
  */
// ------------------------------------------------------------------
// *****BONUS*****
// - You may add more  information to the summary if you want, or sort employees in any fashion you'd like -- sort and group by name, team etc

// REQUIREMENTS ------------------------------------------------------------
/*
    [] There should be some UX to reload the employee list from within the app at any time e.g. a button, pull to refresh, etc.
    [] Must appropriately handle a normal variety of errors when calling endpoint
    [] The app should display useful loading, empty and error states where appropriate
    [] If images fail to load, displaying the placeholder is fine
    [] Tests should be provided for the app. We do not expect 100% code coverage, so please use your best judgment for what should be tested. We’re also interested only in unit tests. Feel free to skip snapshot or app tests.
 */

// IMPORTANT NOTES -----------------------------------------------------
/*
 - Please ensure you do not use more network bandwidth than necessary – load expensive resources such as photos on-demand only.
 - The employee list should not be persisted to disk. You can reload it from the network on each app launch and when refresh is requested — but no more often than that unintentionally
 - Images, however, should be cached on disk so as to not waste device bandwidth. You may use an open source image caching solution, or write your own caching. Do not rely upon HTTP caching for image caching.
 - Note that photos at a given URL will never change. Once one is loaded, you do not need to reload the photo. If an employee’s photo changes, they will be given a new photo URL.

 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello employee directoryy")
    }


}

