angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {
  
  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});
  
  // Form data for the login modal
  $scope.loginData = {};

  // Create the login modal that we will use later
  $ionicModal.fromTemplateUrl('templates/login.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  // Triggered in the login modal to close it
  $scope.closeLogin = function() {
    $scope.modal.hide();
  };

  // Open the login modal
  $scope.login = function() {
    $scope.modal.show();
  };

  // Perform the login action when the user submits the login form
  $scope.doLogin = function() {
    //console.log('Doing login', $scope.loginData);

    BaasBox.setEndPoint("http://vps182663.ovh.net:9000");
        BaasBox.appcode = "1234567890";
        var username= $scope.loginData.username;
            var password= $scope.loginData.password;
            BaasBox.login( username, password)
                .done(function (user) {
                    console.log("Logged in ", user);
                })
                .fail(function (err) {
                    console.log("error ", err);
                })

    // Simulate a login delay. Remove this and replace with your login
    // code if using a login system
    $timeout(function() {
      $scope.closeLogin();
    }, 1000);
  };
  $scope.Logout = function(){
   $scope.modal.show();
     };
     $scope.doLogout =function(){
      BaasBox.setEndPoint("http://vps182663.ovh.net:9000");
        BaasBox.appcode = "1234567890";
      BaasBox.logout()
        .done(function (res) {
          console.log(res);
          alert($scope.loginData.username + " a presto!");
        })
        .fail(function (error) {
          console.log("error ", error);
        })
     }
        // Create the login modal that we will use later
        $ionicModal.fromTemplateUrl('templates/signin.html', {
            scope: $scope
        }).then(function(modal) {
            $scope.modal = modal;
        });

     $scope.signIn =function(){
      $scope.modal.show();
     };

     $scope.dosignIn = function(){
      BaasBox.setEndPoint("http://vps182663.ovh.net:9000");
        BaasBox.appcode = "1234567890";
        var username= $scope.loginData.username;
            var password= $scope.loginData.password;
         var mail= $scope.loginData.mail;
         BaasBox.signup(username, password, {"visibleByRegisteredUsers": {"email" : mail}})
             .done(function (res) {
                 console.log("signup ", res);
             })
             .fail(function (error) {
                 console.log("error ", error);
             });
         $timeout(function() {
             $scope.closeLogin();
         }, 1000);
     }
     $scope.closesignIn = function() {
    $scope.modal.hide();
  };

})

.controller('PlaylistsCtrl', function($scope) {
  $scope.playlists = [
    { title: 'Reggae', id: 1 },
    { title: 'Chill', id: 2 },
    { title: 'Dubstep', id: 3 },
    { title: 'Indie', id: 4 },
    { title: 'Rap', id: 5 },
    { title: 'Cowbell', id: 6 }
  ];
})

.controller('PlaylistCtrl', function($scope, $stateParams) {
});


