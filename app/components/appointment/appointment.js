
'use strict';
angular.module('appointment',['ngRoute','firebase'])
.config(function($routeProvider, $locationProvider) {
  $routeProvider
  .when('/appointment/makeappointment', {
    templateUrl: 'app/components/appointment/makeappointment.html',
    controller: 'AppointmentCtrl'
  })
  .otherwise("/404", {templateUrl: "app/components/home/views/404.html", controller: "PageCtrl"});
  $locationProvider.html5Mode(true);
})

.controller('AppointmentCtrl', function ($scope, $routeParams, $firebase) {
	var ref = new Firebase('https://radiant-fire-8311.firebaseio.com/Appointment');
	var fb = $firebase(ref);

	$scope.date = new Date();
});
