//
//  EventScreenPresenter.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 17/05/2025.
//

enum EventSectionType: Int {
    case upcoming
    case latest
}

protocol EventScreenPresenterProtocol{
    
    func fetchEvent(with type: EventSectionType, sport: String ,leagueId: Int)
    
    func fetchTeamData(for sport: String, leagueId: Int)
}

class EventScreenPresenter{
    
    weak var view: EventsCollectionViewController!
    let providerService: Provider!
    
    init(eventView: EventsCollectionViewController, providerService: Provider) {
        self.view = eventView
        self.providerService = providerService
    }
}

// MARK: Fetching data functions logic
extension EventScreenPresenter: EventScreenPresenterProtocol{
    func fetchEvent(with type: EventSectionType, sport: String ,leagueId: Int) {
        switch sport{
        case "football":
            providerService.getFootballEvents(with: type, with: sport, leagueId: leagueId){[weak self]
                result in
                
                guard let self = self else { print("error in unwrap self in fetchEvent football");return }
                
                switch result {
                    
                case .success(let footballEventsResponse):
                    guard let footballEvents = footballEventsResponse?.result else {
                        print("data is nil when returning from api call in football event screen")
                        return
                    }
                    
                    var eventArr: [EventDataMapper] = []
                    
                    footballEvents.forEach {(event) in
                        eventArr.append(EventDataMapper.createEvent(from: event))
                    }
                    
                    switch type {
                    case .upcoming:
                        self.view.upcomingEventsData = eventArr
                    case .latest:
                        self.view.latestEventsData = eventArr
                    }
                    
                case .failure(let error):
                    
                    print("Error in getting football event in event screen with message: \(error.localizedDescription)")
                }
            }
        case "basketball":
            providerService.getBasketballEvents(with: type, with: sport, leagueId: leagueId){[weak self]
                result in
                
                guard let self = self else { print("error in unwrap self in fetchEvent basketball");return }
                
                switch result {
                    
                case .success(let basketballEventsResponse):
                    guard let basketballEvents = basketballEventsResponse?.result else {
                        print("data is nil when returning from api call in basketball event screen")
                        return
                    }
                    
                    var eventArr: [EventDataMapper] = []
                    
                    basketballEvents.forEach {(event) in
                        eventArr.append(EventDataMapper.createEvent(from: event))
                    }
                    
                    switch type {
                    case .upcoming:
                        self.view.upcomingEventsData = eventArr
                    case .latest:
                        self.view.latestEventsData = eventArr
                    }
                    
                case .failure(let error):
                    
                    print("Error in getting basketball event in event screen with message: \(error.localizedDescription)")
                }
                
            }
        case "cricket":
            providerService.getCrackitEvents(with: type, with: sport, leagueId: leagueId){[weak self]
                result in
                
                guard let self = self else { print("error in unwrap self in fetchEvent cricket");return }
                
                switch result {
                    
                case .success(let cricketEventsResponse):
                    guard let cricketEvents = cricketEventsResponse?.result else {
                        print("data is nil when returning from api call in cricket event screen")
                        return
                    }
                    
                    var eventArr: [EventDataMapper] = []
                    
                    cricketEvents.forEach {(event) in
                        eventArr.append(EventDataMapper.createEvent(from: event))
                    }
                    
                    switch type {
                    case .upcoming:
                        self.view.upcomingEventsData = eventArr
                    case .latest:
                        self.view.latestEventsData = eventArr
                    }
                    
                case .failure(let error):
                    
                    print("Error in getting cricket event in event screen with message: \(error.localizedDescription)")
                }
            }
        case "tennis":
            providerService.getTennisEvents(with: type, with: sport, leagueId: leagueId){[weak self]
                result in
                
                guard let self = self else { print("error in unwrap self in fetchEvent tennis");return }
                
                switch result {
                    
                case .success(let tennisEventsResponse):
                    guard let tennisEvents = tennisEventsResponse?.result else {
                        print("data is nil when returning from api call in tennis event screen")
                        return
                    }
                    
                    var eventArr: [EventDataMapper] = []
                    
                    tennisEvents.forEach {(event) in
                        eventArr.append(EventDataMapper.createEvent(from: event))
                    }
                    
                    switch type {
                    case .upcoming:
                        self.view.upcomingEventsData = eventArr
                    case .latest:
                        self.view.latestEventsData = eventArr
                    }
                    
                case .failure(let error):
                    
                    print("Error in getting tennis event in event screen with message: \(error.localizedDescription)")
                }
            }
        default:
            break
        }
    }
    
    func fetchTeamData(for sport: String, leagueId: Int) {
        
    }
    
}
