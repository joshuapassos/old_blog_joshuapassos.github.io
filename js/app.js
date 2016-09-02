'use strict';
angular.module('MyWebSite', [])
.service('Servic', ['$http', function($http) {
  var baseUrl = "myposts/list.json"; //"http://quiz.kinghost.net/lancador";
  return {
      getfilejson: function(success, error) {
          $http.get(baseUrl).success(success).error(error)
      },
      getmark: function(data,success, error) {
          $http.get(data).success(success).error(error)
      }
  };
}])
.controller('Main', ['Servic', '$rootScope', function(Servic,$rootScope){
   Servic.getfilejson(function(res){
      var gettexto = (post) => {
         Servic.getmark(post.endereco, function(resx){
            var converter = new showdown.Converter()
            var html = converter.makeHtml(resx);
            $("#text").empty().append(html);
            $rootScope.id = post.id;
            $rootScope.datap = post.data;
            $rootScope.tags = post.tags == "" ? 'Sem tags' : 'Tags: ' + post.tags
         }, function(err){
            console.log(err)
         })
      }
      gettexto(res.myposts[0]);
      $rootScope.data = res

      $rootScope.post = (page) =>{
         gettexto(page);
      }
   }, function(err){
      console.log(err)
   })
}])
