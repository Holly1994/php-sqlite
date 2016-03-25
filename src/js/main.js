var app = angular.module('myApp', []);

app.controller('stationListCtrl', function($scope, $http) {

    $scope.changeColor = function () {

        var low, high, value;

        $scope.data.colors.forEach(function (colors) {

            low = document.getElementsByName(colors.quantity + '-low')[0].value;
            high = document.getElementsByName(colors.quantity + '-high')[0].value;

            $scope.data.data.forEach(function (value) {

                if(value[colors.quantity] < low) {
                    value['color_' + colors.quantity] = colors.color_low;
                } else if (value[colors.quantity] < high) {
                    value['color_' + colors.quantity] = colors.color_default;
                } else {
                    value['color_' + colors.quantity] = colors.color_high;
                }
            });
        });
    };
    $http.get('./src/php/server.php')
        .then(function (response) {
            $scope.data = response.data;
        }
    );
});
