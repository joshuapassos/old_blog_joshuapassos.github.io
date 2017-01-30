angular.module('my.controllers', [])

.controller('Main', ['Servic', '$rootScope', function(Servic,$rootScope){
  $rootScope.id = '#'
  $rootScope.titulo = "Project Josh"
  var converter = new showdown.Converter({ extensions: '' })
  Servic.getmark("myposts/sobre.md", function(resx){
    var html = converter.makeHtml(resx);
    $("#sobre").empty().append(html);
     hljs.configure({
        tabReplace: '   ', // 3 spaces
     })
     hljs.initHighlightingOnLoad();

  }, function(err){
     console.log(err)
  })

  Servic.getfilejson(function(res){
    $rootScope.artRecentes = []
    var artigos = res.myposts
    for(i=0;i<=3;i++){
      var art = artigos[artigos.length -i]
      if(art != undefined){
          $rootScope.artRecentes.push(art)
      }
    }
  }, function(err){
       console.log(err)
    })



}])


.controller('Artigo', ['Servic', '$rootScope','$routeParams', function(Servic,$rootScope,$routeParams){
  $rootScope.info = false;
  var converter = new showdown.Converter({ extensions: '' })
  Servic.getfilejson(function(res){
    var artigo = res.myposts[$routeParams.id]
    if(artigo == undefined){
      var html = '<div align="center"><h1> Artigo não encontrado</h1><br><br><br><img src="http://orig01.deviantart.net/abf3/f/2011/233/8/f/profile_picture_by_lazycryplz-d47cxqb.png"/> </div>'
      $("#text").empty().append(html);
    }else{
      $rootScope.info = true;
      $rootScope.titulo = artigo.titulo + " - Project Josh"
      $rootScope.id = artigo.id;
      $rootScope.datap = artigo.data;
      $rootScope.tags = artigo.tags == "" ? 'Sem tags' : 'Tags: ' + artigo.tags
      Servic.getmark(artigo.endereco, function(resx){
        var html = converter.makeHtml(resx);
        $("#text").empty().append(html);
         hljs.configure({
            tabReplace: '   ', // 3 spaces
         })
         hljs.initHighlightingOnLoad();

      }, function(err){
         console.log(err)
      })
    }
  }, function(err){
     console.log(err)
  })
}])


.controller('menu', ['Servic', '$rootScope', function(Servic,$rootScope){
   Servic.getfilejson(function(res){
     $rootScope.data = res
   }, function(err){
      console.log(err)
   })
}])
