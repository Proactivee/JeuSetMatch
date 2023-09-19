//
//  TieBreakGameTestCase.swift
//  JeuSetMatchTests
//
//  Created by Ambroise COLLON on 18/12/2017.
//  Copyright © 2017 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class TieBreakGameTestCase: XCTestCase {
    var tieBreakGame: TieBreakGame!

    override func setUp() {
        super.setUp()
        tieBreakGame = TieBreakGame()
    }

    func testGivenScoreIsZero_WhenIncrementingScore_ThenScoreIsOne() {
        tieBreakGame.incrementScore(forPlayer: .one)

        XCTAssertEqual(tieBreakGame.scores[.one]!, 1)
    }

    func testGivenScoreIs6To0_WhenIncrementingScore_ThenScoreIs7To0AndGameIsWon() {
        tieBreakGame.scores[.one] = 6

        tieBreakGame.incrementScore(forPlayer: .one)

        XCTAssertEqual(tieBreakGame.scores[.one], 7)
        XCTAssertEqual(tieBreakGame.winner, .one)
        XCTAssertTrue(tieBreakGame.isOver)
    }

    func testGivenScoreIs6to6_WhenIncrementingScore_ThenScoreIs7To6AndGameIsNotOver() {
        tieBreakGame.scores[.one] = 6
        tieBreakGame.scores[.two] = 6

        tieBreakGame.incrementScore(forPlayer: .one)

        XCTAssertEqual(tieBreakGame.scores[.one], 7)
        XCTAssertFalse(tieBreakGame.isOver)
    }
}
