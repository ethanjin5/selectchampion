
'use strict';
var app = angular.module('ChampionCounter', ['ngRoute','infinite-scroll','champion','tips','tier']);

app.config(function ($routeProvider, $locationProvider) {
	$routeProvider
		// Home
		.when("/", {templateUrl: "app/components/home/views/home.html", controller: "HomeCtrl", title:"英雄列表"})
		//Champion Detail
		.when("/champion", {templateUrl: "app/components/home/views/home.html", controller: "HomeCtrl", title:"英雄列表"})
		// Pages
		.when("/contact", {templateUrl: "app/components/home/views/contactus.html", controller: "ContactCtrl", title:"关于我们"})
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
app.run(['$location', '$rootScope','$window', function($location, $rootScope, $window) {
    $rootScope.$on('$routeChangeSuccess', function (event, current, previous) {
        $rootScope.title = current.$$route.title;
    });
    $rootScope
        .$on('$stateChangeSuccess',
            function(event){
 
                if (!$window.ga)
                    return;
 
                $window.ga('send', 'pageview', { page: $location.path() });
        });
}])
app.controller('HomeCtrl', function ($scope, $http) {
    $http.get("app/core/champion_list_mysql.php")
        .success(function(response) {$scope.champions = response;
    });
    
    //pagination
    $scope.totalDisplayed = 24;
    $scope.displayMore = function () {
      $scope.totalDisplayed = 127; //increment needed if there are more than 150 champions  
    };
    $scope.loadMore = function() {
        var last = $scope.champions[$scope.champions.length - 1];
        for(var i = 1; i <= 8; i++) {
          $scope.champions.push(last + i);
        }
      };

});

/**
* Controls the ContactUs
*/
app.controller('ContactCtrl', function ($scope,$http,$window) {
    $scope.submitFeedback = function(){
        $http.post('app/core/contactus.php',
            {
                'name'              : $scope.feedback.name,
                'email'             : $scope.feedback.email,
                'feedback'          : $scope.feedback.message
            })
        .success(function(response){
            var defaultForm = {
                name            : "",
                email           : "",
                message         : ""
            }
            $scope.contact_us.$setPristine();
            $scope.feedback = defaultForm;
            $window.alert('提交成功，感谢您的支持！');
        });
    }
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