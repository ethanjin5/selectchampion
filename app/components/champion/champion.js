
'use strict';
angular.module('champion',['ngRoute', 'ngSanitize','ui.bootstrap'])
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
    getInfo();
    
    function getInfo(){
        $http.get("app/components/champion/champion_mysql.php?action=getInfo&param="+$routeParams.name)
            .success(function(response) {
                $scope.champion = response;
                $scope.champ_id = response.id;
            });
    }

    $scope.getCounters = function(id,type){
        $http.get('app/components/champion/champion_mysql.php?action=getCounters&id='+id+'&type='+type)
        .success(function (response) {
            $scope.counters = response;
        });
    }


    //update upvote
    $scope.upvote = function(id,champ_id,type) {
        $http.post('app/components/champion/champion_mysql.php?action=upvote', 
            {
                'counter_id'    : id
            }
        )
        .success(function (response) {
            $scope.getCounters(champ_id,type);
        });
    }

    $scope.downvote = function(id,champ_id,type) {
        $http.post('app/components/champion/champion_mysql.php?action=downvote', 
            {
                'counter_id'    : id
            }
        )
        .success(function (response) {
            $scope.getCounters(champ_id,type);
        });
    }
    
    $scope.getTips = function(counter_id){
        $http.get('app/components/champion/champion_mysql.php?action=getTips&counter_id='+counter_id)
        .success(function (response) {
            $scope.tips = response;
            if(!response.length){
                $scope.tips = [{"tip":"no tips yet, be the first to submit a tip!"}];
            }
        });
    }

    $scope.TipPopover = {
        content: "Hello",
        templateUrl: 'PopoverTipTemplate.html',
      };
    

});
