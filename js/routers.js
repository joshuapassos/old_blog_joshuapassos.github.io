angular.module('my.routes', [])
.config(function($routeProvider,$locationProvider) {
    $routeProvider
    .when("/", {
        templateUrl : "home.html",
        controller: "Main"
    })
    .when("/artigo/:id", {
        templateUrl : "artigo.html",
        controller: "Artigo"
    })
    .when('/404', {
         templateUrl: 'erro.html',

     })
     .otherwise('/404');
})
