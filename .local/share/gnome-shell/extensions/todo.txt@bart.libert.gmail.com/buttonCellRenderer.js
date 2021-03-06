const Gtk = imports.gi.Gtk;
const Lang = imports.lang;
const Signals = imports.signals;

var ButtonCellRenderer = new Lang.Class({
    Name: 'ButtonCellRenderer',
    Extends: Gtk.CellRendererPixbuf,

    _init: function() {
        this.parent();
        this.activateable = true;
        this.mode = Gtk.CellRendererMode.ACTIVATABLE;
    },

    vfunc_activate: function(event, widget, path, background_area, cell_area, flags) {
        this.emit('clicked', path);
    }
});
Signals.addSignalMethods(ButtonCellRenderer.prototype);

/* vi: set expandtab tabstop=4 shiftwidth=4: */
