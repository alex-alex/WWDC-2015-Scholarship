//
//  ScrollScene.swift
//  AlexStudnicka
//
//  Created by Alex Studnicka on 25/04/15.
//  Copyright (c) 2015 Alex Studnicka. All rights reserved.
//

import UIKit
import SceneKit

class ScrollScene: Scene {

	var items: [SCNNode]!
	var labels: [UILabel]!
	let itemsContainer = SCNNode()
	
	// MARK: - Getters
	
	func getItemsCount() -> Int {
		return 0
	}
	
	func getTitle(i: Int) -> String {
		if i >= getItemsCount() { return "" }
		return [][i]
	}
	
	func getImage(i: Int) -> String {
		if i >= getItemsCount() { return "" }
		return [][i]
	}
	
	// MARK: - Setup
	
	override func initSetup() {
		
		self.labels = [UILabel]()
		
		for i in 0..<getItemsCount() {
			let label = UILabel()
			label.frame = CGRect(x: -100, y: -100, width: 200, height: (UIDevice.currentDevice().userInterfaceIdiom == .Phone ? 30 : 50))
			label.text = getTitle(i)
			label.font = UIFont.systemFontOfSize(UIDevice.currentDevice().userInterfaceIdiom == .Phone ? 20 : 32)
			label.textColor = UIColor.whiteColor()
			label.textAlignment = .Center
			rootView.addSubview(label)
			self.labels.append(label)
		}
		
		// --------
		
		let lightNode = SCNNode()
		lightNode.light = SCNLight()
		lightNode.light!.type = SCNLightTypeOmni
		lightNode.position = SCNVector3(x: 0, y: 700, z: 700)
		lightNode.eulerAngles = SCNVector3(x: Float(-M_PI/4), y: 0, z: 0)
		rootNode.addChildNode(lightNode)
		
		let ambientLightNode = SCNNode()
		ambientLightNode.light = SCNLight()
		ambientLightNode.light!.type = SCNLightTypeAmbient
		ambientLightNode.light!.color = UIColor.darkGrayColor()
		rootNode.addChildNode(ambientLightNode)
		
		let floor = SCNFloor()
		let floorNode = SCNNode(geometry: floor)
		floor.firstMaterial = SCNMaterial()
		floor.firstMaterial!.diffuse.contents = UIColor.lightGrayColor()
		rootNode.addChildNode(floorNode)
		
		self.items = [SCNNode]()
		for i in 0..<getItemsCount() {
			let iconPlane = SCNPlane(width: 100, height: 100)
			iconPlane.cornerRadius = 22
			iconPlane.firstMaterial = SCNMaterial()
			iconPlane.firstMaterial!.doubleSided = true
			iconPlane.firstMaterial!.diffuse.contents = UIImage(named: getImage(i))
			
			let point = calcCenter(i, getItemsCount(), 0.5, 200, M_PI)
			
			let iconNode = SCNNode()
			iconNode.position = SCNVector3(x: point.x, y: 100, z: point.y)
			
			let iconInsideNode = SCNNode(geometry: iconPlane)
			iconInsideNode.name = "Item_\(i)"
			iconInsideNode.eulerAngles = SCNVector3(x: 0, y: Float(M_PI), z: 0)
			
			iconNode.addChildNode(iconInsideNode)
			itemsContainer.addChildNode(iconNode)
			self.items.append(iconNode)
		}
		rootNode.addChildNode(itemsContainer)
		
	}
	
	override func setupScene(view: SCNView, cameraNode: SCNNode, animated: Bool) {
		super.setupScene(view, cameraNode: cameraNode, animated: animated)
		
		let lookAt = SCNLookAtConstraint(target: cameraNode)
		lookAt.gimbalLockEnabled = true
		for icon in items {
			icon.constraints = [lookAt]
		}
		
		cameraNode.runAction(SCNAction.group([
			SCNAction.moveTo(SCNVector3(x: 0, y: 600, z: 800), duration: (animated ? 0.3 : 0)),
			SCNAction.rotateToX(CGFloat(-M_PI/6), y: 0, z: 0, duration: (animated ? 0.3 : 0))
		]))
	}
	
	// MARK: - UITapGestureRecognizer
	
	func itemTapped(i: Int) { }
	
	override func handleTap(hitResults: [SCNHitTestResult]) {
		for result in hitResults {
			if let name = result.node.name {
				if name.hasPrefix("Item") {
					let iStr = name.componentsSeparatedByString("_").last!
					let i = iStr.toInt()!
					itemTapped(i)
				}
			}
		}
	}
	
	// MARK: - UIPanGestureRecognizer
	
	var lastPanX: CGFloat = 0
	
	override func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
		
		switch gestureRecognizer.state {
		case .Changed:
			let curPanX = gestureRecognizer.translationInView(rootView).x
			let panX = curPanX - lastPanX
			lastPanX = curPanX
			itemsContainer.eulerAngles.y += Deg2RadF(Float(panX))
			
		case .Ended:
			
			let velocity = Float(gestureRecognizer.velocityInView(rootView).x)
			
			let angle = 360.0 / Float(getItemsCount())
			let duration: CFTimeInterval
			let newAngle: Float
			
			if velocity == 0 {
				let rounded = Rad2DegF(round(itemsContainer.eulerAngles.y / angle))
				newAngle = Deg2RadF(rounded * angle)
				duration = 0.25
			} else {
				let new = Rad2DegF(itemsContainer.eulerAngles.y + (velocity / 100))
				let rounded = round(new / angle)
				newAngle = Deg2RadF(rounded * angle)
				let diff = abs(itemsContainer.eulerAngles.y - newAngle)
				duration = CFTimeInterval(abs(Rad2DegF(diff) / velocity))
			}
			
			SCNTransaction.begin()
			SCNTransaction.setAnimationDuration(duration)
			SCNTransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut))
			itemsContainer.eulerAngles.y = newAngle
			SCNTransaction.commit()
			
		default:
			lastPanX = 0
		}
		
	}
	
	// MARK: - SCNSceneRendererDelegate
	
	override func renderer(aRenderer: SCNSceneRenderer, updateAtTime time: NSTimeInterval) {
		let padding: Float = (UIDevice.currentDevice().userInterfaceIdiom == .Phone ? 55 : 100)
		for (i, icon) in enumerate(items) {
			let point = rootNode.convertPosition(icon.position, fromNode: itemsContainer)
			let projected = aRenderer.projectPoint(point)
			let label = labels[i]
			dispatch_async(dispatch_get_main_queue()) {
				if projected.z <= 0.9989 {
					label.hidden = false
					label.center = CGPoint(x: CGFloat(projected.x), y: CGFloat(projected.y + padding))
				} else {
					label.hidden = true
				}
			}
		}
	}
	
}