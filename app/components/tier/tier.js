
'use strict';
angular.module('tier',['ngRoute'])
.config(function($routeProvider, $locationProvider) {
  $routeProvider
  .when('/tier', {
      templateUrl: 'app/components/tier/tier.html',
      controller: 'TierCtrl',
      title: '排名'
  })
  .otherwise("/404", {templateUrl: "app/components/home/views/404.html", controller: "PageCtrl"});
  $locationProvider.html5Mode(true);
})
.controller('TierCtrl', function ($scope, $http) {
    getInfo();
    $scope.totalDisplayed = 2;
    $scope.tierBold=['Anivia','Brand','DrMundo','Graves','Kayle','MissFortune','Rammus','Malphite','Taric'];

    function getInfo(){
        $http.get("app/components/tier/tier_mysql.php?action=getInfo")
            .success(function(response) {
                $scope.tiers = response;
            });
    }
    
    $scope.loadMore = function(){
        $scope.totalDisplayed = 5;
    }

});
