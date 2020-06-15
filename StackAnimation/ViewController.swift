//
//  ViewController.swift
//  StackAnimation
//
//  Created by Alexander Ignatev on 15.06.2020.
//  Copyright © 2020 Alexandr Ignatyev. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    private let duration: TimeInterval = 0.3
    private var contentView: UIView!

    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var stackView: UIStackView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var containerView0: UIView!
    @IBOutlet private var containerView1: UIView!
    @IBOutlet private var containerView2: UIView!

    // MARK: - Animation

    @IBAction private func animateTitle() {
        UIView.animate(withDuration: duration) {
            self.titleLabel.isHidden.toggle()
        }
    }

    @IBAction private func animate0() {
        UIView.animate(withDuration: duration) {
            self.containerView0.isHidden.toggle()
        }
    }

    @IBAction private func animate1() {
        self.containerView1.isHidden.toggle()
        UIView.transition(
            with: scrollView,
            duration: duration,
            options: .transitionCrossDissolve,
            animations: nil)
    }

    @IBAction private func animate2() {
        if let contentView = contentView {
            contentView.translatesAutoresizingMaskIntoConstraints = false
            containerView2.addSubview(contentView)
            NSLayoutConstraint.activate([
                contentView.topAnchor.constraint(equalTo: containerView2.topAnchor),
                contentView.bottomAnchor.constraint(equalTo: containerView2.bottomAnchor),
                contentView.trailingAnchor.constraint(equalTo: containerView2.trailingAnchor),
                contentView.leadingAnchor.constraint(equalTo: containerView2.leadingAnchor),
            ])
            self.contentView = nil
        } else {
            contentView = containerView2.subviews[0]
            contentView.removeFromSuperview()
        }

        UIView.transition(
            with: containerView2,
            duration: duration,
            options: [.transitionCrossDissolve],
            animations: {
                self.scrollView.layoutIfNeeded()
            })
    }

}

