angular.module('my.services', [])

.service('Servic', ['$http', function($http) {
  var baseUrl = "myposts/list.json"; //"http://quiz.kinghost.net/lancador";
  return {
      getfilejson: function(success, error) {
          $http.get(baseUrl).success(success).error(error)
      },
      getmark: function(arquivo,success, error) {
        $http({method: 'GET',url: arquivo, responseType:"document"}).success(success).error(error)
      }
  };
}])


//data,[responseType="json"]
