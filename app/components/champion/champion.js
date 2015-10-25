
'use strict';
angular.module('champion',['ngRoute', 'ngSanitize','ui.bootstrap'])
.config(function($routeProvider, $locationProvider) {
  $routeProvider
  .when('/champion/:name', {
    templateUrl: 'app/components/champion/champion.html',
    controller: 'ChampionCtrl',
    title: '英雄'
  })
  .otherwise("/404", {templateUrl: "app/components/home/views/404.html", controller: "PageCtrl"});
  $locationProvider.html5Mode(true);
})

.controller('ChampionCtrl', function ($scope, $routeParams, $http, $timeout) {
    $scope.champion_name = $routeParams.name;
    getInfo();
    $timeout(function(){
        $scope.getCounters($scope.champ_id,'全部');
    },500);
    //the controller
    $scope.totalDisplayed = 5;

    $scope.loadMore = function () {
      $scope.totalDisplayed += 5;  
    };
    function getInfo(){
        $http.get("app/components/champion/champion_mysql.php?action=getInfo&param="+$routeParams.name)
            .success(function(response) {
                $scope.champion = response.champion;
                $scope.champ_id = response.champion.id;
                response.type.unshift({type:'全部'});
                $scope.types = response.type;
                
            });
    }

    $scope.getCounters = function(id,type){
        $http.get('app/components/champion/champion_mysql.php?action=getCounters&id='+id+'&type='+type)
        .success(function (response) {
            $scope.counters = response;
            $scope.totalDisplayed = 5; // reset displayed counters on page
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
    
    $scope.getTips = function(champion_weak,champion_strong){
        $http.get('app/components/champion/champion_mysql.php?action=getTips&weak='+champion_weak+'&strong='+champion_strong)
        .success(function (response) {
            $scope.tips = response;
            if(!response.length){
                $scope.tips = [{"tip":"暂无技巧"}];
            }
        });
    }

    $scope.TipPopover = {
        content: 'load $scope.tips', //TODO: tips loading are slower than popover, need a better method
        templateUrl: 'PopoverTipTemplate.html'
      };
    
    

});
