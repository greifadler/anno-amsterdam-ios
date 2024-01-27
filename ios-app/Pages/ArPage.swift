//
//  asdf.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 05/01/2024.
//

import Foundation
//
//  asdf.swift
//  test-ar
//
//  Created by ANNOAMSTERDAM on 05/01/2024.
//

import Foundation
import SwiftUI
import ARCL
import SceneKit
import CoreLocation


struct ArPage: UIViewRepresentable {
    let sceneLocationView = SceneLocationView()
    
    @Binding var selectedBuilding: LocalBuilding?
    
    
    @EnvironmentObject
    var annoStore: AnnoStore
    
    func makeUIView(context: Context) -> SceneLocationView {
        let coordinator = makeCoordinator()
        let tapGesture = UITapGestureRecognizer(target: coordinator, action: #selector(Coordinator.handleTap(_:)))
        sceneLocationView.addGestureRecognizer(tapGesture)
        
        sceneLocationView.run()
        return sceneLocationView
    }
    
    func updateUIView(_ uiView: SceneLocationView, context: Context) {
        // sceneLocationView.updateTraitsIfNeeded()
        updatescreenViews(context: context, coordinator: context.coordinator)
        print("update uiuiu")
        
    }
    
    func updatescreenViews(context: Context, coordinator: Coordinator) {
        //sceneLocationView.removeAllNodes()
        switch annoStore.buildings {
        case .success(let buildingArray):
            for building in buildingArray {
                let coordinate = CLLocationCoordinate2D(latitude: building.latitude, longitude: building.longitude)
                let location = CLLocation(coordinate: coordinate, altitude: 0) // Adjust altitude as needed
                
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
                label.backgroundColor = .white
                label.textColor = .black
                label.textAlignment = .center
                label.text = building.name
                
                let swiftUIView = BuildingPreviewCard(
                    name: building.name,
                    year: building.year,
                    distance: String(building.distance),
                    typeOfUse: building.typeOfUse,
                    onExit: {
                        // Handle exit action
                    }
                )
                
                
                // Render SwiftUI view to UIImage
                let uiImage = imageFromSwiftUIView(swiftUIView, size: CGSize(width: 248, height: 200))
                
                
                
                let annotationNode = LocationAnnotationNode(location: location, image: uiImage)
                
                coordinator.associateNode(annotationNode.annotationNode, withBuilding: building)
                
                
                sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
            }
        default:
            print("nononono")
        }
    }
    func imageFromSwiftUIView<V: View>(_ view: V, size: CGSize) -> UIImage {
        let controller = UIHostingController(rootView: view)
        controller.view.frame = CGRect(origin: .zero, size: size)
        controller.view.backgroundColor = .clear // Ensure the background is clear
        
        let renderer = UIGraphicsImageRenderer(size: size, format: UIGraphicsImageRendererFormat.preferred())
        return renderer.image { _ in
            controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
    
    // Define the Coordinator to handle the tap gesture
    class Coordinator: NSObject {
        @Binding var selectedBuilding: LocalBuilding?
        var buildingMap = [SCNNode: LocalBuilding]()
        
        init(selectedBuilding: Binding<LocalBuilding?>) {
            _selectedBuilding = selectedBuilding
        }
        
        func associateNode(_ node: SCNNode, withBuilding building: LocalBuilding) {
            buildingMap[node] = building
        }
        
        @objc func handleTap(_ gesture: UITapGestureRecognizer) {
            print("gandals")
            
            let location = gesture.location(in: gesture.view)
            if let sceneView = gesture.view as? SceneLocationView {
                let hitResults = sceneView.hitTest(location, options: nil)
                if let firstHit = hitResults.first,
                   let building = buildingMap[firstHit.node] {
                    self.selectedBuilding = building
                    print(self.selectedBuilding)
                }
            }
        }
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(selectedBuilding: $selectedBuilding)
    }
}
