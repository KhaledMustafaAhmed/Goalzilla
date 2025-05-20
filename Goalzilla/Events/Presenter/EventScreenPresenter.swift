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
    
    func leagueToFavouriteAction(leagueId: Int , leagueLogo:String,leagueTitle:String)
    
    func addToFavourite(leagueId: Int , leagueLogo:String,leagueTitle:String)
    
    func removeFromFavourite(leagueId: Int , leagueName:String , leagueLogo:String)
    
    func checkifLeagueAtFavourite(leagueId:Int)->Bool
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
                        self.view.upcomingDataLoaded(with: eventArr)
                    case .latest:
                        self.view.latestDataLoaded(with: eventArr)
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
                    print(eventArr)
                    switch type {
                    case .upcoming:
                        self.view.upcomingDataLoaded(with: eventArr)
                    case .latest:
                        self.view.latestDataLoaded(with: eventArr)
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
                        self.view.upcomingDataLoaded(with: eventArr)
                    case .latest:
                        self.view.latestDataLoaded(with: eventArr)
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
                        self.view.upcomingDataLoaded(with: eventArr)
                    case .latest:
                        self.view.latestDataLoaded(with: eventArr)
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
        switch sport {
        case "football":
            providerService.getFootballTeams(with: sport, leagueId: leagueId) {[weak self] result in
                switch result{
                case .success(let footballTeamResponse):
                    
                    guard let footballTeamData = footballTeamResponse?.result else {
                        print("football team data success but return with nil no data")
                        return
                    }
                 //   print("Football team data: \(footballTeamData)")
                    var teamArr: [TeamDataMapper] = []
                    
                    footballTeamData.forEach { FootballTeam in
                        teamArr.append(TeamDataMapper.creatTeamMapper(with: FootballTeam))
                    }
                    
                  //  print("football team mappper array: \(teamArr)")
                    
                    self?.view.teamDataLoaded(with: teamArr)
                    
                case .failure(let error):
                    print("football team call result faild in fetchTeamData \(error.localizedDescription)")
                }
            }
        case "basketball":
            providerService.getBasketballTeams(with: sport, leagueId: leagueId) {[weak self] result in
                switch result{
                case .success(let basketballTeamResponse):
                    
                    guard let basketballTeamData = basketballTeamResponse?.result else {
                        print("basketball team data success but return with nil no data")
                        return
                    }
                    print("basketball team data: \(basketballTeamData)")
                    var teamArr: [TeamDataMapper] = []
                    
                    basketballTeamData.forEach { BasketballTeam in
                        teamArr.append(TeamDataMapper.creatTeamMapper(with: BasketballTeam))
                    }
                    
                    print("basketball team mappper array: \(teamArr)")
                    
                    self?.view.teamDataLoaded(with: teamArr)
                    
                case .failure(let error):
                    print("basketball team call result faild in fetchTeamData \(error.localizedDescription)")
                }
            }
        case "tennis":
            providerService.getTennisPlayersRanking(with: sport, leagueId: leagueId) {[weak self] result in
                switch result{
                case .success(let tennisTeamResponse):
                    
                    guard let tennisTeamData = tennisTeamResponse?.result else {
                        print("tennis team data success but return with nil no data")
                        return
                    }
                    print("tennis team data: \(tennisTeamData)")
                    var teamArr: [TeamDataMapper] = []
                    
                    tennisTeamData.forEach { tennisTeam in
                        teamArr.append(TeamDataMapper.creatTeamMapper(with: tennisTeam))
                    }
                    
                    print("tennis team mappper array: \(teamArr)")
                    
                    self?.view.teamDataLoaded(with: teamArr)
                    
                case .failure(let error):
                    print("tennis team call result faild in fetchTeamData \(error.localizedDescription)")
                }
            }
        case "cricket":
            providerService.getCrackitTeams(with: sport, leagueId: leagueId) {[weak self] result in
                switch result{
                case .success(let cricketTeamResponse):
                    
                    guard let cricketTeamData = cricketTeamResponse?.result else {
                        print("cricket team data success but return with nil no data")
                        return
                    }
                    print("cricket team data: \(cricketTeamData)")
                    var teamArr: [TeamDataMapper] = []
                    
                    cricketTeamData.forEach { cricketTeam in
                        teamArr.append(TeamDataMapper.creatTeamMapper(with: cricketTeam))
                    }
                    
                    print("cricket team mappper array: \(teamArr)")
                    
                    self?.view.teamDataLoaded(with: teamArr)
                    
                case .failure(let error):
                    print("cricket team call result faild in fetchTeamData \(error.localizedDescription)")
                }
            }
        default:
            break
        }
    }
    
    
    
    func leagueToFavouriteAction(leagueId: Int, leagueLogo: String, leagueTitle: String) {
        if checkifLeagueAtFavourite(leagueId: leagueId){
            removeFromFavourite(leagueId: leagueId, leagueName: leagueTitle, leagueLogo: leagueLogo)
        }else{
            addToFavourite(leagueId: leagueId, leagueLogo: leagueLogo, leagueTitle: leagueTitle)
        }
       
    }

    func addToFavourite(leagueId:Int,leagueLogo:String, leagueTitle:String){
        providerService.addLeagueToFavourites(FavouritesModel(leagueId: leagueId, leagueName: leagueTitle, leagueLogo: leagueLogo))
        self.view.renderAddingToFavouriteAction()
    }
    func removeFromFavourite(leagueId: Int , leagueName:String , leagueLogo:String) {
        let _ = providerService.removeLeagueFromFavourites(FavouritesModel(leagueId: leagueId, leagueName: leagueName, leagueLogo: leagueLogo))
        self.view.renderRemoveFromFavouriteAction()
    }
    
    func checkifLeagueAtFavourite(leagueId:Int)->Bool{
        return self.providerService.checkifLeagueAtFavourite(leagueId: leagueId)
    }
    
}
