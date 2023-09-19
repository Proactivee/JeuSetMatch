//
//  SetTestCase.swift
//  JeuSetMatchTests
//
//  Created by Ambroise COLLON on 08/11/2017.
//  Copyright © 2017 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class SetTestCase: XCTestCase {
    var set = Set()

    override func setUp() {
        super.setUp()
        set = Set()
    }

    func createManyGames(_ count: Int, wonByPlayer player: Player) {
        for _ in 1...count {
            let game = Game()
            game.winner = player
            set.games.append(game)
        }
    }

    func testGivenPlayerWinsByThreeGamesToTwo_WhenGettingScoreFromSet_ThenScoreShouldBeThreeToTwo() {
        createManyGames(2, wonByPlayer: .one)
        createManyGames(3, wonByPlayer: .two)

        XCTAssertEqual(set.scores[.one], 2)
        XCTAssertEqual(set.scores[.two], 3)
    }

    func testGivenSetIsNotOver_WhenGettingWinner_ThenWinnerShouldBeNil() {
        XCTAssertNil(set.winner)
    }

    func testGivenPlayerOneHasWonSixGames_WhenGettingWinner_ThenWinnerShouldBePlayerOne() {
        createManyGames(6, wonByPlayer: .one)

        XCTAssertEqual(set.winner, .one)
        XCTAssertTrue(set.isOver)
    }

    func testGivenScoreIs6To5_WhenGettingWinner_ThenWinnerIsNilAndGameIsNotOver() {
        createManyGames(6, wonByPlayer: .one)
        createManyGames(5, wonByPlayer: .two)

        XCTAssertNil(set.winner)
        XCTAssertFalse(set.isOver)
    }

    func testGivenScoreIs7to6_WhenGettingWinner_ThenWinnerIsPlayerOneAndGameIsOver() {
        createManyGames(7, wonByPlayer: .one)
        createManyGames(6, wonByPlayer: .two)

        XCTAssertEqual(set.winner, .one)
        XCTAssertTrue(set.isOver)

    }
}
