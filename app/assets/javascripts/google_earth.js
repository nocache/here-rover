
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

  // Get the location info via a KML response:
  //  the url should be set in the view, because it doesn't work if it is
  //  a relative url
  link.setHref(kml_url);

  var networkLink = ge.createNetworkLink('');
  networkLink.set(link, true, true); // Sets the link, refreshVisibility, and flyToView.

  ge.getFeatures().appendChild(networkLink);
}

function failureCB(errorCode) {
}

function showApollo11() {
  lookAt = ge.createLookAt('');
  // Aitken Basin:
  // lookAt.set(-16.800000, 173.400000, 0, ge.ALTITUDE_RELATIVE_TO_GROUND, -4.378803, 0, 135000);
  lookAt.set(0.681400, 23.460550, 0, ge.ALTITUDE_RELATIVE_TO_GROUND, -1.946649, 0, 130);
  ge.getView().setAbstractView(lookAt);
}

google.setOnLoadCallback(init);

