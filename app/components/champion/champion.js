
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

.controller('ChampionCtrl', function ($scope, $routeParams, $http, $timeout, $uibModal, $log) {
    $scope.champion_name = $routeParams.name;
    $scope.upvoted = [];
    $scope.downvoted = [];
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
                $scope.getGeneralTips(response.champion.id);
                response.type.unshift({type:'全部'});
                $scope.types = response.type;
                
            });
    }
    
    $scope.getGeneralTips = function(champ_id){
        $http.get("app/components/champion/champion_mysql.php?action=getGeneralTips&param="+champ_id)
            .success(function(response) {
                $scope.generalTips = response;
                if(!response.length){
                    $scope.generalTips = [{"tip":"暂无技巧"}];
                }
            });
    }
    $scope.getCounters = function(id,type){
        $http.get('app/components/champion/champion_mysql.php?action=getCounters&id='+id+'&type='+type)
        .success(function (response) {
            $scope.counters = response;
            $scope.totalDisplayed = 5; // reset displayed counters on page
        });
    }
    
    //figured it out :::::

    $scope.open = function (champ_id,champ_name) {
        var modalInstance = $uibModal.open({
            templateUrl: 'myModalContent.html',
            controller: 'ModalInstanceCtrl',
            resolve: {
            champ_id: function () {
                return champ_id;
            },
            champ_name: function(){
                return champ_name;}
            }
        });
        modalInstance.result.then(function () {
            $scope.getGeneralTips($scope.champ_id);
        });
    };

    //update upvote
    $scope.upvote = function(id,champ_id,type) {
        
        if($scope.upvoted.indexOf(id) > -1){var cancel = true;}else{cancel=false;}
        $http.post('app/components/champion/champion_mysql.php?action=upvote&cancel='+cancel, 
            {
                'counter_id'    : id
            }
        )
        .success(function (response) {
            $scope.getCounters(champ_id,type);
            if($scope.upvoted.indexOf(id) > -1){
                $scope.upvoted.splice($scope.upvoted.indexOf(id),1);
            }else{$scope.upvoted.push(id);}
            
        });
    }

    $scope.downvote = function(id,champ_id,type) {
        if($scope.downvoted.indexOf(id) > -1){var cancel = true;}else{cancel=false;}
        $http.post('app/components/champion/champion_mysql.php?action=downvote&cancel='+cancel, 
            {
                'counter_id'    : id
            }
        )
        .success(function (response) {
            $scope.getCounters(champ_id,type);
            if($scope.downvoted.indexOf(id) > -1){
                $scope.downvoted.splice($scope.downvoted.indexOf(id),1);
            }else{$scope.downvoted.push(id);}
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
    }
    
    $scope.tipUpvote = function(tip_id){
        $http.post('app/components/champion/champion_mysql.php?action=tipUpvote', 
            {
                'tip_id'    : tip_id
            }
        )
        .success(function (response) {
            $scope.getGeneralTips($scope.champ_id);
        });
    }
    $scope.tipDownvote = function(tip_id){
        $http.post('app/components/champion/champion_mysql.php?action=tipDownvote', 
            {
                'tip_id'    : tip_id
            }
        )
        .success(function (response) {
            $scope.getGeneralTips($scope.champ_id);
        });
    }
    
});


// Please note that $modalInstance represents a modal window (instance) dependency.
// It is not the same as the $uibModal service used above.

angular.module('champion').controller('ModalInstanceCtrl', function ($scope, $uibModalInstance, $http, champ_id, champ_name) {
    $scope.champ_id = champ_id;
    $scope.champ_name = champ_name;

    $scope.ok = function () {
        $uibModalInstance.close($scope.selected.item);
    };
    
    $scope.submitTip = function(champion_id){
        console.log(champion_id);
        $http.post('app/components/champion/champion_mysql.php?action=submitGeneralTip',
            {
                'champion_id'       : champion_id,
                'name'              : $scope.tip.name,
                'tip'               : $scope.tip.tip
            }
        )
        .success(function(response){
            var defaultForm = {
                champion_id     : "",
                name            : "",
                email           : "",
                tip             : ""
            }
            $scope.add_tip.$setPristine();
            $scope.tip = defaultForm;
            
            $uibModalInstance.close();
        });
    }

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});