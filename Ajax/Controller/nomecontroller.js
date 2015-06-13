angular.module('myApp', []).controller('namesCtrl', ['$scope',function($scope) {
    $scope.names = [
        {id: '001',name:'Giovanni',surname:'Garibaldi',country:'Norway'},
        {id: '002',name:'Antonio',surname:'Rossi',country:'ssssae'},
        {id: '003',name:'Pippo',surname:'Verdi',country:'Norwarfadf'}
    ];
}]);