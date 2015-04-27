//
//  AppsScene.swift
//  AlexStudnicka
//
//  Created by Alex Studnicka on 20/04/15.
//  Copyright (c) 2015 Alex Studnicka. All rights reserved.
//

import UIKit
import SceneKit

class AppsScene: ScrollScene {
	
	// MARK: - Getters
	
	override func getItemsCount() -> Int {
		return 7
	}
	
	override func getTitle(i: Int) -> String {
		if i >= getItemsCount() { return "" }
		return ["České SMS", "QuickBloxx", "Ingrios", "mySchoolNotebook", "Czech Railways", "Cinema City", "Optics"][i]
	}
	
	override func getImage(i: Int) -> String {
		if i >= getItemsCount() { return "" }
		return ["CeskeSMSIcon", "QuickBloxxIcon", "IngriosIcon", "SchoolNoteBookIcon", "CDIcon", "CinemaCityIcon", "OpticsIcon"][i]
	}
	
	// MARK: - Setup
	
	override func initSetup() {
		super.initSetup()
		
		let size = AppDelegate.instance.window!.bounds.size
		
		let backLabel = UILabel()
		backLabel.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
		backLabel.center = CGPoint(x: CGFloat(size.width/2), y: CGFloat(size.height/2)+(UIDevice.currentDevice().userInterfaceIdiom == .Phone ? 20 : 35))
		backLabel.text = "< BACK"
		backLabel.font = UIFont.systemFontOfSize(18)
		backLabel.textColor = UIColor.whiteColor()
		backLabel.textAlignment = .Center
		rootView.addSubview(backLabel)

		// --------
		
		let textNode = makeTextNode("My Apps", size: 50)
		textNode.position.y += 150
		rootNode.addChildNode(textNode)
		
		let sphere = SCNSphere(radius: 80)
		let sphereNode = SCNNode(geometry: sphere)
		sphereNode.name = "Sphere"
		sphereNode.position = SCNVector3(x: 0, y: 100, z: 0)
		sphere.firstMaterial = SCNMaterial()
		sphere.firstMaterial!.diffuse.contents = UIColor.redColor()
		rootNode.addChildNode(sphereNode)
		
	}
	
	// MARK: - UITapGestureRecognizer
	
	override func itemTapped(i: Int) {
		switch i {
		case 0:
			delegate.setScene(CeskeSMSScene.self)
		case 1:
			delegate.setScene(QuickBloxxScene.self)
		case 2:
			delegate.setScene(IngriosScene.self)
		case 3:
			delegate.setScene(SchoolNotebookScene.self)
		case 4:
			delegate.setScene(CDScene.self)
		case 5:
			delegate.setScene(CinemaCityScene.self)
		case 6:
			delegate.setScene(OpticsScene.self)
		default:
			break
		}
	}
	
	override func handleTap(hitResults: [SCNHitTestResult]) {
		super.handleTap(hitResults)
		
		for result in hitResults {
			if let name = result.node.name {
				if name.hasPrefix("Sphere") {
					delegate.setScene(MainScene.self)
				}
			}
		}
	}
	
}
