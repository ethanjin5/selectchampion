
'use strict';
angular.module('tips',['ngRoute'])
.config(function($routeProvider, $locationProvider) {
  $routeProvider
  .when('/champion/:name/tips/:type/:counter_id', {
    templateUrl: 'app/components/tips/tips.html',
    controller: 'TipsCtrl'
  })
  .otherwise("/404", {templateUrl: "app/components/home/views/404.html", controller: "PageCtrl"});
  $locationProvider.html5Mode(true);
})

.controller('TipsCtrl', function ($scope, $routeParams, $http) {
    $scope.champion_name = $routeParams.name;
    if ($routeParams.type =='weak'){
        $scope.type = true;
    }
    else{$scope.type=false;}
    $scope.counter_id = $routeParams.counter_id;
    getInfo();
    
    function getInfo(){
        $http.get("app/components/tips/tips_mysql.php?action=getInfo&param="+$routeParams.counter_id)
            .success(function(response) {
                $scope.counter = response;
            });
    }
    $scope.getTips = function(){
        $http.get("app/components/tips/tips_mysql.php?action=getTips&param="+$routeParams.counter_id)
            .success(function(response) {
                $scope.tips = response;
                if(!response.length){
                    $scope.tips = [{"tip":"no tips yet, be the first to submit a tip!"}];
                }
            });
    }
    $scope.submitTip = function(counter_id){
        $http.post('app/components/tips/tips_mysql.php?action=submitTips',
            {
                'counter_id'    : counter_id,
                'name'          : $scope.tip.name,
                'tip'           : $scope.tip.tip
            }
        )
        .success(function(response){
            var defaultForm = {
                counter_id  : "",
                name        : "",
                email       : "",
                tip         : ""
            }
            $scope.add_tip.$setPristine();
            $scope.tip = defaultForm;
            $scope.getTips(counter_id);
        });
    }


    //update upvote
    $scope.upvote = function(tip_id,counter_id) {
        $http.post('app/components/tips/tips_mysql.php?action=upvote', 
            {
                'tip_id'    : tip_id
            }
        )
        .success(function (response) {
            $scope.getTips(counter_id);
        });
    }

    $scope.downvote = function(tip_id,counter_id) {
        $http.post('app/components/tips/tips_mysql.php?action=downvote', 
            {
                'tip_id'    : tip_id
            }
        )
        .success(function (response) {
            $scope.getTips(counter_id);
        });
    }
    

});
