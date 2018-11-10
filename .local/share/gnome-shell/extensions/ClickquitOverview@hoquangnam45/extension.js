const Main = imports.ui.main;
const Shell = imports.gi.Shell;

var connectid = null;
var reactiveBefore = null;

function _showDesktop() {
    Main.overview.hide();
}

function init() {
    reactiveBefore=Main.overview.viewSelector._workspacesDisplay.actor.reactive;
}

function enable() {
    Main.overview.viewSelector._workspacesDisplay.actor.reactive=true;
    connectid = Main.overview.viewSelector._workspacesDisplay.actor.connect('button-press-event', _showDesktop);
}

function disable() {
    Main.overview.viewSelector._workspacesDisplay.actor.reactive=reactiveBefore;
    Main.overview.viewSelector._workspacesDisplay.actor.disconnect(connectid);
}
