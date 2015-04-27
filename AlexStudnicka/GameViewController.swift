//
//  GameViewController.swift
//  AlexStudnicka
//
//  Created by Alex Studnicka on 02/04/15.
//  Copyright (c) 2015 Alex Studnicka. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController, SCNSceneRendererDelegate, SceneDelegate {
	
	var scnView: SCNView!
	var currentScene: Scene?
	let cameraNode = SCNNode()
	
	var mainScene: MainScene!
	var appsScene: AppsScene!
	
	// MARK: - UIViewController
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.scnView = self.view as! SCNView
		
		scnView.backgroundColor = UIColor.darkGrayColor()
//		scnView.allowsCameraControl = true
//		scnView.showsStatistics = true
//		scnView.playing = true
		
		let scene = SCNScene()
		scnView.scene = scene
		
		cameraNode.camera = SCNCamera()
		cameraNode.camera!.zFar = 10000
		cameraNode.position = SCNVector3(x: 0, y: 600, z: 800)
		cameraNode.eulerAngles = SCNVector3(x: Float(-M_PI/6), y: 0, z: 0)
		scene.rootNode.addChildNode(cameraNode)
		scnView.pointOfView = cameraNode
		
		let tapGesture = UITapGestureRecognizer(target: self, action: "handleTap:")
		let panGesture = UIPanGestureRecognizer(target: self, action: "handlePan:")
		var gestureRecognizers: [AnyObject] = [tapGesture, panGesture]
		if let existingGestureRecognizers = scnView.gestureRecognizers {
			gestureRecognizers.extend(existingGestureRecognizers)
		}
		scnView.gestureRecognizers = gestureRecognizers
		
		// ----------------------------------------------------------------
		
		mainScene = MainScene(delegate: self)
		appsScene = AppsScene(delegate: self)
		setScene(MainScene.self, animated: false)
		
	}
	
	override func prefersStatusBarHidden() -> Bool {
		return true
	}
	
	// MARK: - SceneDelegate

	func setScene(sceneClass: Scene.Type) {
		setScene(sceneClass, animated: true)
	}
	
	func setScene(sceneClass: Scene.Type, animated: Bool) {
		let scene: Scene
		
		if sceneClass is MainScene.Type {
			scene = mainScene
		} else if sceneClass is AppsScene.Type {
			scene = appsScene
		} else {
			scene = sceneClass(delegate: self)
		}
		
		let block: () -> () = {
			scene.setupScene(self.scnView, cameraNode: self.cameraNode, animated: animated)
		}
		
		if let oldScene = self.currentScene {
			oldScene.teardownScene(animated, completion: block)
		} else {
			block()
		}
		
		self.currentScene = scene
	}
	
	// MARK: - UITapGestureRecognizer
	
	func handleTap(gestureRecognize: UIGestureRecognizer) {
		let p = gestureRecognize.locationInView(scnView)
		if let hitResults = scnView.hitTest(p, options: nil) as? [SCNHitTestResult] {
			if let scene = currentScene {
				scene.handleTap(hitResults)
			}
		}
	}
	
	// MARK: - UIPanGestureRecognizer
	
	func handlePan(gestureRecognize: UIPanGestureRecognizer) {
		if let scene = currentScene {
			scene.handlePan(gestureRecognize)
		}
	}
	
	// MARK: - SCNSceneRendererDelegate
	
	func renderer(aRenderer: SCNSceneRenderer, updateAtTime time: NSTimeInterval) {
		if let scene = currentScene {
			scene.renderer(aRenderer, updateAtTime: time)
		}
	}
	
}
