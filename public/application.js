'use strict';
var app = angular.module('minimaxApp', ['ngRoute', 'minimaxApp.controllers', 'minimaxApp.services']);
app.config(['$routeProvider', '$locationProvider', '$httpProvider', function($routeProvider, $locationProvider, $httpProvider){
    $routeProvider
    .when('/', {
        templateUrl: 'app/partials/root.html',
        controller: 'RootController',
    })
    .when('/games/new', {
        templateUrl: 'app/partials/new_game.html',
        controller: 'NewGameController'
    })
    .when('/game/:id', {
        templateUrl: 'app/partials/game.html',
        controller: 'GameController'
    })
    .otherwise({redirectTo: '/'});

    $httpProvider.defaults.withCredentials = true;
}]);
