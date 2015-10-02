
'use strict';
angular.module('champion',['ngRoute'])
.config(function($routeProvider, $locationProvider) {
  $routeProvider
  .when('/champion/:name', {
    templateUrl: 'app/components/champion/champion.html',
    controller: 'ChampionCtrl'
  })
  .otherwise("/404", {templateUrl: "app/components/home/views/404.html", controller: "PageCtrl"});
  $locationProvider.html5Mode(true);
})

.controller('ChampionCtrl', function ($scope, $routeParams) {
  $scope.champion_name = $routeParams.name;

	$scope.date = new Date();
});
