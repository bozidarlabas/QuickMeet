//
//  AppointmentListViewController.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import UIKit
import Combine

class AppointmentListViewController: UIViewController {
    
    // Properties
    private var presenter: AppointmentListPresenter!
    private var cancellables = Set<AnyCancellable>()
    let transition = CircularTransition()
    
    // Views
    var containerView = UIView()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    var addAppointmentButton = CircularButton()
    
    var topViewsContainer = UIView()
    var borderLine = UIView()
    var leftInfoView = HomeInfoView()
    var rightInfoView = HomeInfoView()
    
    
    convenience init(presenter: AppointmentListPresenter) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        bindUI()
        title = "title_appointments".localized
        
    }
    
    private func bindUI() {
        addAppointmentButton
            .publisher(for: .touchUpInside)
            .sink { [weak self] _ in
                self?.presenter.addAppointmentButtonSelected()
            }.store(in: &cancellables)
    }
}

// MARK: - UIViewControllerTransitioningDelegate
extension AppointmentListViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = addAppointmentButton.center
        transition.circleColor = addAppointmentButton.backgroundColor!
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = addAppointmentButton.center
        transition.circleColor = addAppointmentButton.backgroundColor!
        
        return transition
    }
    
}

// MARK: - UICollectionViewDataSource
extension AppointmentListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.appointments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppointmentCollectionViewCell.identifier, for: indexPath) as? AppointmentCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let appointment = presenter.appointments[indexPath.item]
        cell.configure(with: appointment)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

// MARK: - UICollectionViewDelegate
extension AppointmentListViewController: UICollectionViewDelegate {
    // Implement delegate methods as needed
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AppointmentListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 100
        return CGSize(width: collectionView.bounds.width - 30, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
