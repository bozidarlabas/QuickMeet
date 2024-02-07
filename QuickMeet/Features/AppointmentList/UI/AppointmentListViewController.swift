//
//  AppointmentListViewController.swift
//  QuickMeet
//
//  Created by Bozidar Labas on 05.02.2024..
//

import UIKit
import Hero
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
    
    var emptyListLabel = UILabel()
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
        updateUI()
        title = "title_appointments".localized
        hero.isEnabled = true
    }
    
    private func bindUI() {
        addAppointmentButton
            .publisher(for: .touchUpInside)
            .sink { [weak self] _ in
                self?.presenter.addAppointmentButtonSelected()
            }.store(in: &cancellables)
        
        presenter
            .appointmentsPublisher
            .sink { [weak self] _ in
                self?.updateUI()
                self?.collectionView.reloadData()
            }.store(in: &cancellables)
        
        presenter.startObserving()
    }
    
    private func updateUI() {
        if presenter.numberOfTodayAppointments == 1 {
            leftInfoView.label2.text = String(format: "title_one_appointment".localized, presenter.numberOfTodayAppointments)
        } else {
            leftInfoView.label2.text = String(format: "title_multiple_appointments".localized, presenter.numberOfTodayAppointments)
        }
        
        if presenter.numberOfUpcomingAppointments == 1 {
            rightInfoView.label2.text = String(format: "title_one_appointment".localized, presenter.numberOfUpcomingAppointments)
        } else {
            rightInfoView.label2.text = String(format: "title_multiple_appointments".localized, presenter.numberOfUpcomingAppointments)
        }

        emptyListLabel.isHidden = !presenter.appointments.isEmpty
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
        guard 
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppointmentCollectionViewCell.identifier, for: indexPath) as? AppointmentCollectionViewCell,
            let appointment = presenter.appointments[safeIndex: indexPath.item]
        else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: appointment)
        cell.hero.id = "\(AnimationConstants.listToDetailsKey) \(appointment.id)"
        cell.dateTimeLabel.hero.id = "\(AnimationConstants.listToDetailsDateTimeKey) \(appointment.id)"
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

// MARK: - UICollectionViewDelegate
extension AppointmentListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let appointment = presenter.appointments[safeIndex: indexPath.item] else { return }
        presenter.appointmentItemSelected(selectedModel: appointment)
    }
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
