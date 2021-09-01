/* global QUnit */
QUnit.config.autostart = false;

sap.ui.getCore().attachInit(function () {
	"use strict";

	sap.ui.require([
		"hedge-file-upload/test/unit/AllTests"
	], function () {
		QUnit.start();
	});
});
