import SwiftUI
import Timeline
import Account
import Env
import Status
import DesignSystem

extension View {
  func withAppRouteur() -> some View {
    self.navigationDestination(for: RouteurDestinations.self) { destination in
      switch destination {
      case let .accountDetail(id):
        AccountDetailView(accountId: id)
      case let .accountDetailWithAccount(account):
        AccountDetailView(account: account)
      case let .statusDetail(id):
        StatusDetailView(statusId: id)
      case let .hashTag(tag, accountId):
        TimelineView(timeline: .hashtag(tag: tag, accountId: accountId))
      case let .following(id):
        AccountsListView(accountId: id, mode: .following)
      case let .followers(id):
        AccountsListView(accountId: id, mode: .followers)
      }
    }
  }
  
  func withSheetDestinations(sheetDestinations: Binding<SheetDestinations?>) -> some View {
    self.sheet(item: sheetDestinations) { destination in
      switch destination {
      case .statusEditor:
        StatusEditorView()
      }
    }
  }
}
