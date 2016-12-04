'use strict';
var controllers = angular.module('minimaxApp.controllers');
controllers.controller('NewGameController', ['$scope', 'ApiService', function($scope, ApiService){
    var gameId = null;
    $scope.thinking = false;
    ApiService.newGame().then(function(game){
        loadGame(game);
    });

    $scope.makeMovement = function(x, y){
        $scope.thinking = true;
        $scope.rows[x][y] = $scope.player_character;
        ApiService.makeMovement(gameId, x, y).then(function(game){
            $scope.thinking = false;
            loadGame(game);
        });
    };

    function loadGame(game){
        gameId = game.id;
        $scope.turn = game.turn;
        $scope.rows = game.board;
        $scope.finished = game.finished;
        $scope.winner = game.winner;
        $scope.player_character = game.player_character;
        $scope.draw = game.draw;

        if($scope.finished && !$scope.draw && game.winner.match(game.player_character)){
            $scope.alertType = 'alert-success';
        }else{
            $scope.alertType = 'alert-danger';
        }
    }
}]);