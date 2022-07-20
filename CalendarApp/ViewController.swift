//
//  ViewController.swift
//  CalendarApp
//
//  Created by Vasichko Anna on 19.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCalendar()
    }
    
    private func configureCalendar() {
        let calendarView = UICalendarView()
        calendarView.calendar = .current
        calendarView.locale = .current
        
        calendarView.visibleDateComponents = DateComponents(calendar: .current, year: 2022, month: 5)
        
        calendarView.fontDesign = .rounded
        calendarView.backgroundColor = .systemYellow
        calendarView.layer.cornerRadius = 15
        
        let dateSelection = UICalendarSelectionMultiDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
        calendarView.delegate = self
        
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendarView)
        
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calendarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            calendarView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}

extension ViewController: UICalendarViewDelegate, UICalendarSelectionMultiDateDelegate {
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
        
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
        
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canSelectDate dateComponents: DateComponents) -> Bool {
        false
    }
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        return .customView {
            let emoji = UILabel()
            emoji.text = "🦄"
            return emoji
        }
    }
}
