import SwiftUI

struct AnnoTabView: View {
    @State private var selectedTab = 0
    
    @State private var isKeyboardVisible = false
    
    @State private var selectedBuilding: LocalBuilding? = nil

    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Content based on the selected tab
                switch selectedTab {
                case 0:
                    AppleMapPage()
                case 1:
                    ArPage(selectedBuilding: $selectedBuilding)
                    if let building = selectedBuilding {
                                        NavigationLink(destination: DetailsPage(slimBuilding: building)
                                                        .environmentObject(DetailsStore())
                                                        .navigationBarBackButtonHidden(true),
                                                       isActive: Binding(
                                                        get: { self.selectedBuilding != nil },
                                                        set: { if !$0 { self.selectedBuilding = nil } }
                                                       )) {
                                            EmptyView()
                                        }
                                    }
                case 2:
                    BuildingListView()
                default:
                    AppleMapPage()
                }
                
                // Custom tab bar
                if(!isKeyboardVisible) {
                    
                HStack(spacing: 0) {
                    TabBarItem(imageName: "map", text: "Map", isSelected: selectedTab == 0) {
                        selectedTab = 0
                    }
                    .frame(width: geometry.size.width / 3)
                    
                    TabBarItem(imageName: "camera", text: "Lens", isSelected: selectedTab == 1) {
                        selectedTab = 1
                    }
                    .frame(width: geometry.size.width / 3)
                    
                    TabBarItem(imageName: "list.bullet", text: "List", isSelected: selectedTab == 2) {
                        selectedTab = 2
                    }
                    .frame(width: geometry.size.width / 3)
                }
                .padding(.top, 10)
                //.border(Color.blue, width: 1)
                //.overlay(Divider()
                    //.background
                        // (Color.annoBlue)
//, alignment: .top)

                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                TopNavAnnoAdam()
            }
        }
        .onReceive(KeyboardVisibilityManager.shared.$isVisible) { isVisible in
                    self.isKeyboardVisible = isVisible
                }
        
    }
}

struct TabBarItem: View {
    var imageName: String
    var text: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            VStack {
                Image(systemName: imageName)
                    .imageScale(.large)
                    .foregroundColor(isSelected ? .annoRed : .annoBlue)
                    .padding(EdgeInsets(top: 1, leading: 0, bottom: 1, trailing: 0))

                Text(text.uppercased())
                    .font(Font.custom("NotoSerif-Regular", size: 10))
                    .foregroundColor(isSelected ? .annoRed : .annoBlue)
                Divider()
                    .overlay(isSelected ? .annoRed : .white) // Your custom color
                    .frame(width: 30, height: 1)

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnnoTabView()
    }
}
