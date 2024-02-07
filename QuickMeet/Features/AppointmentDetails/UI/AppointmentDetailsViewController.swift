//
//  AppointmentDetails.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 06.02.2024..
//

import Hero
import UIKit
import Combine

class AppointmentDetailsViewController: UIViewController {
    
    // Properties
    private var presenter: AppointmentDetailsPresenter!
    private var cancellables = Set<AnyCancellable>()
    
    // Views
    let scrollView = UIScrollView()
    let scrollViewContainer = UIView()
    var firstContainer = UIView()
    let dateView = TwoLabelsView()
    let locationView = TwoLabelsView()
    var deleteButton = UIButton()
    var editButton = UIButton()
    
    var secondContainer = UIView()
    var detailsLabel = UILabel()
    var detailsDescriptionLabel = UILabel()
    
    convenience init(presenter: AppointmentDetailsPresenter) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        updateUI()
        bindUI()
    }
    
    private func bindUI() {
        deleteButton
            .publisher(for: .touchUpInside)
            .sink { [unowned self] in
                self.showDeleteAlert()
            }.store(in: &cancellables)
        
        editButton
            .publisher(for: .touchUpInside)
            .sink { [unowned self] in
                presenter.editButtonSelected()
            }.store(in: &cancellables)
        
        presenter.editedAppointmentPublisher.sink { [unowned self] _  in
            updateUI()
        }.store(in: &cancellables)
    }
    
    private func updateUI() {
        dateView.label2.text = presenter.selectedModel.formatedDateTime
        locationView.label2.text = presenter.selectedModel.location
        detailsDescriptionLabel.text = presenter.selectedModel.details
    }
    
    private func showDeleteAlert() {
        let reusableAlert = ReusableAlertController(title: "QuickMeet", message: "message_delete".localized, okButtonTitle: "title_delete".localized) { [unowned self] in
            presenter.deleteButtonSelected()
            navigationController?.popViewController(animated: true)
        }
        
        present(reusableAlert, animated: true, completion: nil)
    }
    
}
