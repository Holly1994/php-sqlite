var app = angular.module('myApp', []);

app.controller('stationListCtrl', function($scope, $http) {
    $http.get('./src/php/server.php')
        .then(function (response) {
            $scope.names = response.data;
        }
    );
});

app.controller('thresholdCtrl', function($scope, $http) {
    $http.get('./src/php/threshold.php')
        .then(function (response) {
            $scope.thresholds = response.data;
            console.log($scope.thresholds);
        }
    );
});
