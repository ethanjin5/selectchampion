
'use strict';
angular.module('tips',['ngRoute'])
.config(function($routeProvider, $locationProvider) {
  $routeProvider
  .when('/champion/tips/:champion_weak/:champion_strong', {
    templateUrl: 'app/components/tips/tips.html',
    controller: 'TipsCtrl',
      title: 'Tips'
  })
  .otherwise("/404", {templateUrl: "app/components/home/views/404.html", controller: "PageCtrl"});
  $locationProvider.html5Mode(true);
})
.controller('TipsCtrl', function ($scope, $routeParams, $http) {
    if ($routeParams.type =='weak'){
        $scope.type = true;
    }
    else{$scope.type=false;}
    getInfo();
    
    function getInfo(){
        $http.get("app/components/tips/tips_mysql.php?action=getInfo&weak="+$routeParams.champion_weak+"&strong="+$routeParams.champion_strong)
            .success(function(response) {
                $scope.counter = response;
                $scope.getTips(response.weak.id,response.strong.id);
            });
    }
    $scope.getTips = function(champion_weak,champion_strong){
        $http.get("app/components/tips/tips_mysql.php?action=getTips&weak="+champion_weak+"&strong="+champion_strong)
            .success(function(response) {
                $scope.tips = response;
                if(!response.length){
                    $scope.tips = [{"tip":"no tips yet, be the first to submit a tip!"}];
                }
            });
    }
    $scope.submitTip = function(champion_weak,champion_strong){
        $http.post('app/components/tips/tips_mysql.php?action=submitTips',
            {
                'champion_weak'     : champion_weak,
                'champion_strong'   : champion_strong,
                'name'              : $scope.tip.name,
                'tip'               : $scope.tip.tip
            }
        )
        .success(function(response){
            var defaultForm = {
                champion_weak   : "",
                champion_strong : "",
                name            : "",
                email           : "",
                tip             : ""
            }
            $scope.add_tip.$setPristine();
            $scope.tip = defaultForm;
            $scope.getTips($scope.counter.weak.id,$scope.counter.strong.id);
        });
    }


    //update upvote
    $scope.upvote = function(tip_id) {
        $http.post('app/components/tips/tips_mysql.php?action=upvote', 
            {
                'tip_id'    : tip_id
            }
        )
        .success(function (response) {
            $scope.getTips($scope.counter.weak.id,$scope.counter.strong.id);
        });
    }

    $scope.downvote = function(tip_id) {
        $http.post('app/components/tips/tips_mysql.php?action=downvote', 
            {
                'tip_id'    : tip_id
            }
        )
        .success(function (response) {
            $scope.getTips($scope.counter.weak.id,$scope.counter.strong.id);
        });
    }
    

});
