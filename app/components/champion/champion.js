
'use strict';
angular.module('champion',['ngRoute', 'ngSanitize'])
.config(function($routeProvider, $locationProvider) {
  $routeProvider
  .when('/champion/:name', {
    templateUrl: 'app/components/champion/champion.html',
    controller: 'ChampionCtrl'
  })
  .otherwise("/404", {templateUrl: "app/components/home/views/404.html", controller: "PageCtrl"});
  $locationProvider.html5Mode(true);
})

.controller('ChampionCtrl', function ($scope, $routeParams, $http) {
    $scope.champion_name = $routeParams.name;
    getCounters();
    function getCounters(){
      $http.get("app/components/champion/champion_mysql.php?action=getInfo&param="+$routeParams.name)
      .success(function(response) {
        $scope.champion = response.champion;
        $scope.counters = response.counters;
      });
    }


    //update upvote
    $scope.upvote = function(id) {
        $http.post('app/components/champion/champion_mysql.php?action=upvote', 
            {
                'counter_id'    : id
            }
        )
        .success(function (response) {
          getCounters();
        })
    }

    $scope.downvote = function(id) {
        $http.post('app/components/champion/champion_mysql.php?action=downvote', 
            {
                'counter_id'    : id
            }
        )
        .success(function (response) {
          getCounters();
        })
    }



});
