
'use strict';
var app = angular.module('ChampionCounter', ['ngRoute','infinite-scroll','champion','tips','tier']);

app.config(function ($routeProvider, $locationProvider) {
	$routeProvider
		// Home
		.when("/", {templateUrl: "app/components/home/views/home.html", controller: "HomeCtrl", title:"全部英雄"})
		//Champion Detail
		.when("/champion", {templateUrl: "app/components/home/views/home.html", controller: "HomeCtrl", title:"全部英雄"})
		// Pages
		.when("/contact", {templateUrl: "app/components/home/views/contactus.html", controller: "PageCtrl", title:"联系我们"})
		.when("/faq", {templateUrl: "app/components/home/views/faq.html", controller: "PageCtrl"})
		/* etc… routes to other pages… */
		// Blog
		.when("/blog", {templateUrl: "app/components/home/views/blog.html", controller: "BlogCtrl",title:"Blog"})
		.when("/blog/article1", {templateUrl: "app/components/home/views/article1.html", controller: "BlogCtrl"})
		.when("/blog/article2", {templateUrl: "app/components/home/views/article2.html", controller: "BlogCtrl"})
		// else 404
		//.otherwise("/404", {templateUrl: "app/components/home/views/404.html", controller: "PageCtrl"});
		.otherwise({redirectTo: '/'});

		$locationProvider.html5Mode(true);

});

/**
* Controls the Home
*/
app.run(['$location', '$rootScope', function($location, $rootScope) {
    $rootScope.$on('$routeChangeSuccess', function (event, current, previous) {
        $rootScope.title = current.$$route.title;
    });
}])
app.controller('HomeCtrl', function ($scope, $http) {
    $scope.$on('$routeChangeSuccess', function (event, data) {
            $scope.pageTitle = data.title;
        });
    $http.get("app/core/champion_list_mysql.php")
        .success(function(response) {$scope.champions = response;});

});

/**
* Controls the Blog
*/
app.controller('BlogCtrl', function (/* $scope, $location, $http */) {
console.log("Blog Controller reporting for duty.");
});


/**
* Controls all other Pages
*/
app.controller('PageCtrl', function () {
	// Activates the Carousel
	$('.carousel').carousel({
	interval: 5000
	});

	// Activates Tooltips for Social Links
	$('.tooltip-social').tooltip({
	selector: "a[data-toggle=tooltip]"
	})
});