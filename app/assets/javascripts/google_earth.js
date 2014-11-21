
var ge;
var lookAt;
google.load("earth", "1", {"other_params":"sensor=false"});

function init() {
  google.earth.createInstance('map3d', initCB, failureCB, { database: 'http://khmdb.google.com/?db=moon' });
}

function initCB(instance) {
  ge = instance;
  ge.getWindow().setVisibility(true);
  ge.getNavigationControl().setVisibility(ge.VISIBILITY_SHOW);

  var link = ge.createLink('');
  var href = 'rover/all.kml';
  link.setHref(href);

  var networkLink = ge.createNetworkLink('');
  networkLink.set(link, true, true); // Sets the link, refreshVisibility, and flyToView.

  ge.getFeatures().appendChild(networkLink);
}

function failureCB(errorCode) {
}

function showApollo11() {
   lookAt = ge.createLookAt('');
   lookAt.set(0.681400, 23.460550, 0, ge.ALTITUDE_RELATIVE_TO_GROUND, -1.946649, 0, 130);
   ge.getView().setAbstractView(lookAt);
}

google.setOnLoadCallback(init);

// Aitken Basin:
// lookAt.set(-16.800000, 173.400000, 0, ge.ALTITUDE_RELATIVE_TO_GROUND, -4.378803, 0, 135000);
//
