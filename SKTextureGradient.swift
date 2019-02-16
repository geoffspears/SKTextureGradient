//
//  SKTextureGradient.swift
//	Linear gradient texture
//	Based on: https://gist.github.com/Tantas/7fc01803d6b559da48d6, https://gist.github.com/craiggrummitt/ad855e358004b5480960
//
//  Created by Maxim on 1/1/16.
//  Copyright © 2016 Maxim Bilan. All rights reserved.
//

import SpriteKit

public enum GradientDirection
{
    case up
    case down
    case left
    case right
    case upLeft
    case upRight
    case downLeft
    case downRight
}

public extension SKTexture {

    convenience init?(size: CGSize, color1: SKColor, color2: SKColor, direction: GradientDirection = .up) {

        self.init?(size: size, color1: CIColor(color: color1), color2: CIColor(color: color2), direction: direction)
    }

	convenience init?(size: CGSize, color1: CIColor, color2: CIColor, direction: GradientDirection = .up) {

		guard let filter = CIFilter(name: "CILinearGradient")
        else {
            return nil
        }
		var startVector: CIVector
		var endVector: CIVector
		
		filter.setDefaults()
		
		switch direction {
			case .up:
				startVector = CIVector(x: size.width * 0.5, y: 0)
				endVector = CIVector(x: size.width * 0.5, y: size.height)
            case .down:
                startVector = CIVector(x: size.width * 0.5, y: size.height)
                endVector = CIVector(x: size.width * 0.5, y: 0)
			case .left:
				startVector = CIVector(x: size.width, y: size.height * 0.5)
				endVector = CIVector(x: 0, y: size.height * 0.5)
            case .right:
                startVector = CIVector(x: 0, y: size.height * 0.5)
                endVector = CIVector(x: size.width, y: size.height * 0.5)
			case .upLeft:
				startVector = CIVector(x: size.width, y: 0)
				endVector = CIVector(x: 0, y: size.height)
			case .upRight:
				startVector = CIVector(x: 0, y: 0)
				endVector = CIVector(x: size.width, y: size.height)
            case .downLeft:
                startVector = CIVector(x: size.width, y: size.height)
                endVector = CIVector(x: 0, y: 0)
            case .downRight:
                startVector = CIVector(x: 0, y: size.height)
                endVector = CIVector(x: size.width, y: 0)
		}

		filter.setValue(startVector, forKey: "inputPoint0")
		filter.setValue(endVector, forKey: "inputPoint1")
		filter.setValue(color1, forKey: "inputColor0")
		filter.setValue(color2, forKey: "inputColor1")
		
        guard let output = filter.outputImage,
              let image = CIContext(options: nil).createCGImage(output, from: CGRect(origin: .zero, size: size))
        else {
            return nil
        }
        self.init(cgImage: image)
	}
}
