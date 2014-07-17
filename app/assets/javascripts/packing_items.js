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
    });
  };

  $scope.editPackingItem = function(packing_item) {
    packing_item.editing = true;
  };

  $scope.updatePackingItem = function(packing_item) {
    packing_item.$update(function() {
      packing_item.editing = false;
    }, function(errors) {
      $scope.errors = errors.data;
    });
  };

  $scope.deletePackingItem = function(packing_item) {
    packing_item.$delete(function() {
      position = $scope.packingItems.indexOf(packing_item);
      $scope.packingItems.splice(position, 1);
    }, function(errors) {
      $scope.errors = errors.data;
    });
  };

  $scope.clearErrors = function() {
    $scope.errors = null;
  };

}]);
