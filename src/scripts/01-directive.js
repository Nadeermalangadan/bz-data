(function () {

    var app = angular.module('bzData', []);

    app.directive('bzData', ['$parse', function ($parse) {
        var id = 0;
        return {
            restrict: 'A',
            scope: true,
            controller: ['$scope', function ($scope) {
                var _data = undefined;
                this.data = $scope.data = function (data) {
                    if (angular.isDefined(data)) {
                        _data = data;
                        return this;
                    }
                    return _data;
                };
                this.$$hashKey = $scope.$$hashKey;
            }],
            link: function (scope, element, attr) {
                scope.$$hashKey = id++;
                scope.$watch(attr.bzData, function (value) {
                    scope.data(value);
                });
            }
        }
    }]);

}());