'use strict';
var services = angular.module('minimaxApp.services', []);
services.service('ApiService', ['$http', '$q', '$rootScope', '$window', function($http, $q, $rootScope, $window){

    var api = {
        newGame: function(){
            var deferred = $q.defer();
            $http.get('/api/games/new')
            .success(function(data, status){
                deferred.resolve(data);
            });

            return deferred.promise;
        },
        makeMovement: function(id, x, y){
            var deferred = $q.defer();
            $http.post('/api/games/'+id+'/make_movement', {x: x, y: y})
            .success(function(data, status){
                deferred.resolve(data);
            });

            return deferred.promise;
        }
    };

    return api;
}]);