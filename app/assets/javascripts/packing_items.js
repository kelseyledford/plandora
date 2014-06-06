var plandoraApp = angular.module('plandora-app', ['ngResource']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

plandoraApp.factory('PackingItem', ['$resource', function($resource) {
  return $resource('packing_items/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
}]);

plandoraApp.controller('PackingItemCtrl', ['PackingItem', '$scope', function(PackingItem, $scope) {
  $scope.packingItems= [];

  $scope.newPackingItem = new PackingItem();

  PackingItem.query(function(packingItems) {
    $scope.packingItems = packingItems;
  });

  $scope.savePackingItem = function () {
  	$scope.newPackingItem.$save(function(packing_item) {
  		$scope.packingItems.push(packing_item);
  		$scope.newPackingItem = new PackingItem();
  		console.log(packing_item);
  	});
  };

}]);

