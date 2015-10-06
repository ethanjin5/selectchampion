
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
    
    $http.get("app/components/champion/champion_mysql.php?param="+$routeParams.name)
    .success(function(response) {
      $scope.champion = response.champion;
      $scope.counter = response.counter;
    });

	$scope.date = new Date();
});
