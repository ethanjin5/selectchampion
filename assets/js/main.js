/**
* Main AngularJS Web Application
*/
var app = angular.module('healthwise', ['ngRoute']);

/**
* Configure the Routes
*/
app.config(function ($routeProvider, $locationProvider) {
	$routeProvider
		// Home
		.when("/", {templateUrl: "views/partials/home.html", controller: "PageCtrl"})
		// Pages
		.when("/about", {templateUrl: "views/partials/about.html", controller: "PageCtrl"})
		.when("/faq", {templateUrl: "views/partials/faq.html", controller: "PageCtrl"})
		/* etc… routes to other pages… */
		// Blog
		.when("/blog", {templateUrl: "views/partials/blog.html", controller: "BlogCtrl"})
		.when("/blog/post", {templateUrl: "views/partials/blog_item.html", controller: "BlogCtrl"})
		// else 404
		.otherwise("/404", {templateUrl: "views/partials/404.html", controller: "PageCtrl"});

		$locationProvider.html5Mode(true);

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
app.controller('PageCtrl', function (/* $scope, $location, $http */) {
console.log("Page Controller reporting for duty.");

// Activates the Carousel
$('.carousel').carousel({
interval: 5000
});

// Activates Tooltips for Social Links
$('.tooltip-social').tooltip({
selector: "a[data-toggle=tooltip]"
})
});