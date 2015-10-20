
'use strict';
angular.module('tier',['ngRoute'])
.config(function($routeProvider, $locationProvider) {
  $routeProvider
  .when('/tier', {
      templateUrl: 'app/components/tier/tier.html',
      controller: 'TierCtrl',
      title: 'Tier'
  })
  .otherwise("/404", {templateUrl: "app/components/home/views/404.html", controller: "PageCtrl"});
  $locationProvider.html5Mode(true);
})
.run(['$location', '$rootScope', function($location, $rootScope) {
    $rootScope.$on('$routeChangeSuccess', function (event, current, previous) {
        $rootScope.title = current.$$route.title;
    });
}])
.controller('TierCtrl', function ($scope, $http) {
    getInfo();
    function getInfo(){
        $http.get("app/components/tier/tier_mysql.php?action=getInfo")
            .success(function(response) {
                $scope.tiers = response;
            });
    }

});
