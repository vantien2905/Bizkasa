//
//  KActivityIndicatorType.swift
//  DemoLoading
//
//  Created by Tien Dinh on 8/16/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

public enum KActivityIndicatorType: Int {
    /**
     Blank.
     
     - returns: Instance of KActivityIndicatorAnimationBlank.
     */
    case blank
    /**
     BallPulse.
     
     - returns: Instance of KActivityIndicatorAnimationBallPulse.
     */
    case ballPulse
    /**
     BallGridPulse.
     
     - returns: Instance of KActivityIndicatorAnimationBallGridPulse.
     */
    case ballGridPulse
    /**
     BallClipRotate.
     
     - returns: Instance of KActivityIndicatorAnimationBallClipRotate.
     */
    case ballClipRotate
    /**
     SquareSpin.
     
     - returns: Instance of KActivityIndicatorAnimationSquareSpin.
     */
    case squareSpin
    /**
     BallClipRotatePulse.
     
     - returns: Instance of KActivityIndicatorAnimationBallClipRotatePulse.
     */
    case ballClipRotatePulse
    /**
     BallClipRotateMultiple.
     
     - returns: Instance of KActivityIndicatorAnimationBallClipRotateMultiple.
     */
    case ballClipRotateMultiple
    /**
     BallPulseRise.
     
     - returns: Instance of KActivityIndicatorAnimationBallPulseRise.
     */
    case ballPulseRise
    /**
     BallRotate.
     
     - returns: Instance of KActivityIndicatorAnimationBallRotate.
     */
    case ballRotate
    /**
     CubeTransition.
     
     - returns: Instance of KActivityIndicatorAnimationCubeTransition.
     */
    case cubeTransition
    /**
     BallZigZag.
     
     - returns: Instance of KActivityIndicatorAnimationBallZigZag.
     */
    case ballZigZag
    /**
     BallZigZagDeflect
     
     - returns: Instance of KActivityIndicatorAnimationBallZigZagDeflect
     */
    case ballZigZagDeflect
    /**
     BallTrianglePath.
     
     - returns: Instance of KActivityIndicatorAnimationBallTrianglePath.
     */
    case ballTrianglePath
    /**
     BallScale.
     
     - returns: Instance of KActivityIndicatorAnimationBallScale.
     */
    case ballScale
    /**
     LineScale.
     
     - returns: Instance of KActivityIndicatorAnimationLineScale.
     */
    case lineScale
    /**
     LineScaleParty.
     
     - returns: Instance of KActivityIndicatorAnimationLineScaleParty.
     */
    case lineScaleParty
    /**
     BallScaleMultiple.
     
     - returns: Instance of KActivityIndicatorAnimationBallScaleMultiple.
     */
    case ballScaleMultiple
    /**
     BallPulseSync.
     
     - returns: Instance of KActivityIndicatorAnimationBallPulseSync.
     */
    case ballPulseSync
    /**
     BallBeat.
     
     - returns: Instance of KActivityIndicatorAnimationBallBeat.
     */
    case ballBeat
    /**
     LineScalePulseOut.
     
     - returns: Instance of KActivityIndicatorAnimationLineScalePulseOut.
     */
    case lineScalePulseOut
    /**
     LineScalePulseOutRapid.
     
     - returns: Instance of KActivityIndicatorAnimationLineScalePulseOutRapid.
     */
    case lineScalePulseOutRapid
    /**
     BallScaleRipple.
     
     - returns: Instance of KActivityIndicatorAnimationBallScaleRipple.
     */
    case ballScaleRipple
    /**
     BallScaleRippleMultiple.
     
     - returns: Instance of KActivityIndicatorAnimationBallScaleRippleMultiple.
     */
    case ballScaleRippleMultiple
    /**
     BallSpinFadeLoader.
     
     - returns: Instance of KActivityIndicatorAnimationBallSpinFadeLoader.
     */
    case ballSpinFadeLoader
    /**
     LineSpinFadeLoader.
     
     - returns: Instance of KActivityIndicatorAnimationLineSpinFadeLoader.
     */
    case lineSpinFadeLoader
    /**
     TriangleSkewSpin.
     
     - returns: Instance of KActivityIndicatorAnimationTriangleSkewSpin.
     */
    case triangleSkewSpin
    /**
     Pacman.
     
     - returns: Instance of KActivityIndicatorAnimationPacman.
     */
    case pacman
    /**
     BallGridBeat.
     
     - returns: Instance of KActivityIndicatorAnimationBallGridBeat.
     */
    case ballGridBeat
    /**
     SemiCircleSpin.
     
     - returns: Instance of KActivityIndicatorAnimationSemiCircleSpin.
     */
    case semiCircleSpin
    /**
     BallRotateChase.
     
     - returns: Instance of KActivityIndicatorAnimationBallRotateChase.
     */
    case ballRotateChase
    /**
     Orbit.
     
     - returns: Instance of KActivityIndicatorAnimationOrbit.
     */
    case orbit
    /**
     AudioEqualizer.
     
     - returns: Instance of KActivityIndicatorAnimationAudioEqualizer.
     */
    case audioEqualizer
    /**
     Stroke.
     
     - returns: Instance of KActivityIndicatorAnimationCircleStrokeSpin.
     */
    case circleStrokeSpin
    
    static let allTypes = (blank.rawValue ... circleStrokeSpin.rawValue).map { KActivityIndicatorType(rawValue: $0)! }
    
    
    // swiftlint:disable:next cyclomatic_complexity function_body_length
    func animation() -> KActivityIndicatorAnimationDelegate {
        switch self {
        case .blank:
            return KActivityIndicatorAnimationBlank()
        case .ballPulse:
            return KActivityIndicatorAnimationBallPulse()
        case .ballGridPulse:
            return KActivityIndicatorAnimationBallGridPulse()
        case .ballClipRotate:
            return KActivityIndicatorAnimationBallClipRotate()
        case .squareSpin:
            return KActivityIndicatorAnimationSquareSpin()
        case .ballClipRotatePulse:
            return KActivityIndicatorAnimationBallClipRotatePulse()
        case .ballClipRotateMultiple:
            return KActivityIndicatorAnimationBallClipRotateMultiple()
        case .ballPulseRise:
            return KActivityIndicatorAnimationBallPulseRise()
        case .ballRotate:
            return KActivityIndicatorAnimationBallRotate()
        case .cubeTransition:
            return KActivityIndicatorAnimationCubeTransition()
        case .ballZigZag:
            return KActivityIndicatorAnimationBallZigZag()
        case .ballZigZagDeflect:
            return KActivityIndicatorAnimationBallZigZagDeflect()
        case .ballTrianglePath:
            return KActivityIndicatorAnimationBallTrianglePath()
        case .ballScale:
            return KActivityIndicatorAnimationBallScale()
        case .lineScale:
            return KActivityIndicatorAnimationLineScale()
        case .lineScaleParty:
            return KActivityIndicatorAnimationLineScaleParty()
        case .ballScaleMultiple:
            return KActivityIndicatorAnimationBallScaleMultiple()
        case .ballPulseSync:
            return KActivityIndicatorAnimationBallPulseSync()
        case .ballBeat:
            return KActivityIndicatorAnimationBallBeat()
        case .lineScalePulseOut:
            return KActivityIndicatorAnimationLineScalePulseOut()
        case .lineScalePulseOutRapid:
            return KActivityIndicatorAnimationLineScalePulseOutRapid()
        case .ballScaleRipple:
            return KActivityIndicatorAnimationBallScaleRipple()
        case .ballScaleRippleMultiple:
            return KActivityIndicatorAnimationBallScaleRippleMultiple()
        case .ballSpinFadeLoader:
            return KActivityIndicatorAnimationBallSpinFadeLoader()
        case .lineSpinFadeLoader:
            return KActivityIndicatorAnimationLineSpinFadeLoader()
        case .triangleSkewSpin:
            return KActivityIndicatorAnimationTriangleSkewSpin()
        case .pacman:
            return KActivityIndicatorAnimationPacman()
        case .ballGridBeat:
            return KActivityIndicatorAnimationBallGridBeat()
        case .semiCircleSpin:
            return KActivityIndicatorAnimationSemiCircleSpin()
        case .ballRotateChase:
            return KActivityIndicatorAnimationBallRotateChase()
        case .orbit:
            return KActivityIndicatorAnimationOrbit()
        case .audioEqualizer:
            return KActivityIndicatorAnimationAudioEqualizer()
        case .circleStrokeSpin:
            return KActivityIndicatorAnimationCircleStrokeSpin()
        }
    }
}
