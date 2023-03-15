//
//  MapViewController.swift
//  WeatherApp
//
//  Created by Kevin Munui on 3/15/23.
//

import Foundation
import UIKit

class MapViewController: UIViewController {
    
    // MARK: - variables
    var viewModel:MapViewModel?
    
    // MARK: - Initialization
    init(_ vm: MapViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = vm
        self.initializeUI()
    }
    
    func initializeUI() {
        self.view.backgroundColor = .green
    }
    
    // MARK: - De-initialization
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UI Components
    
    // MARK: - Action
    
    // MARK: - Business Logic
}
