
var app = angular.module('scopeExample', []);
  app.controller('MyController', ['$scope', function($scope) {
    $scope.username = 'World';

    $scope.sayHello = function() {
      $scope.greeting = 'Hello ' + $scope.username + '!';
    };
  }]);
