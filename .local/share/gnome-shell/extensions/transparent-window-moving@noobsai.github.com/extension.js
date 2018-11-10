const Tweener = imports.ui.tweener;
const Meta = imports.gi.Meta;
const GLib = imports.gi.GLib;

const ExtensionUtils = imports.misc.extensionUtils;
const Me = ExtensionUtils.getCurrentExtension();
const Convenience = Me.imports.convenience;

let _settings = null;
let _WindowState;

let _on_window_garb_begin, _on_window_garb_end;
let _on_move_changed, _on_resize_changed;

let _allowed_grab_operations = [];
let _grab_moving_operations = [
  Meta.GrabOp.MOVING,
  Meta.GrabOp.KEYBOARD_MOVING
];

let _grab_resizing_operations = [
  Meta.GrabOp.RESIZING_NW,
  Meta.GrabOp.RESIZING_N,
  Meta.GrabOp.RESIZING_NE,
  Meta.GrabOp.RESIZING_E,
  Meta.GrabOp.RESIZING_SW,
  Meta.GrabOp.RESIZING_S,
  Meta.GrabOp.RESIZING_SE,
  Meta.GrabOp.RESIZING_W,
  Meta.GrabOp.KEYBOARD_RESIZING_UNKNOWN,
  Meta.GrabOp.KEYBOARD_RESIZING_NW,
  Meta.GrabOp.KEYBOARD_RESIZING_N,
  Meta.GrabOp.KEYBOARD_RESIZING_NE,
  Meta.GrabOp.KEYBOARD_RESIZING_E,
  Meta.GrabOp.KEYBOARD_RESIZING_SW,
  Meta.GrabOp.KEYBOARD_RESIZING_S,
  Meta.GrabOp.KEYBOARD_RESIZING_SE,
  Meta.GrabOp.KEYBOARD_RESIZING_W
];

function init_grab_operations() {
  _allowed_grab_operations = [];
  if (_settings.get_boolean('transparent-on-moving')) {
    _allowed_grab_operations.push(..._grab_moving_operations);
  }

  if (_settings.get_boolean('transparent-on-resizing')) {
    _allowed_grab_operations.push(..._grab_resizing_operations);
  }
}

function is_grab_operation_allowed(grab_op) {
  return _allowed_grab_operations.indexOf(grab_op) > -1; 
}

function set_opacity(window_actor, target_opacity, on_complete, check_if_completed) {
  let transition_time = _settings.get_double('transition-time');

  let state = _WindowState[window_actor.meta_window.get_pid()];
  let thread = Date.now();
  state.thread = thread;

  let complete_func = function() { 
    state.thread = 0;
    if (on_complete) { 
      on_complete(); 
    }
  };

  if (transition_time < 0.001) { 
    window_actor.opacity = target_opacity;
    complete_func();
  } else {
    Tweener.addTween(window_actor, {
        time: transition_time,
        transition: 'easeOutQuad',
        opacity: target_opacity,
        onComplete: complete_func
    });
    if (check_if_completed) {
      set_timeout(function() { 
        if (state && state.thread == thread){
          window_actor.opacity = target_opacity;
          complete_func();
        }
      }, transition_time * 1000 + 100); // repair opacity if the Tween was canceled
    }
  }
}

function set_timeout(func, time){
  GLib.timeout_add(GLib.PRIORITY_DEFAULT, time, function() {
    func();
    return false;
  });
}

function window_garb_begin(meta_display, meta_screen, meta_window, meta_grab_op, gpointer) {
  if (!meta_window || !is_grab_operation_allowed(meta_grab_op)) {
    return;
  }

  let window_actor = meta_window.get_compositor_private();
  let pid = meta_window.get_pid();

  let state = _WindowState[pid];
  if (!state) {
    state = { thread: -1, original_opacity: window_actor.opacity }
    _WindowState[pid] = state;
  }

  let opacity_value = _settings.get_int('window-opacity');
  set_opacity(window_actor, opacity_value);
}

function window_garb_end(meta_display, meta_screen, meta_window, meta_grab_op, gpointer) {
  if (!meta_window || !is_grab_operation_allowed(meta_grab_op)) {
    return;
  }

  let window_actor = meta_window.get_compositor_private();
  let pid = meta_window.get_pid();

  let state = _WindowState[pid];
  set_opacity(window_actor, state.original_opacity, function() { delete _WindowState[pid]; }, true);
}

function enable() {
  _settings = Convenience.getSettings();
  init_grab_operations();
  _WindowState = {};
  _on_window_garb_begin = global.display.connect('grab-op-begin', window_garb_begin);
  _on_window_garb_end = global.display.connect('grab-op-end', window_garb_end);
  _on_move_changed = _settings.connect('changed::transparent-on-moving', init_grab_operations);
  _on_resize_changed = _settings.connect('changed::transparent-on-resizing', init_grab_operations);
}

function disable() {
  global.display.disconnect(_on_window_garb_begin);
  global.display.disconnect(_on_window_garb_end);
  _settings.disconnect(_on_move_changed);
  _settings.disconnect(_on_resize_changed);

  _WindowState = {};
  _settings.run_dispose();
}

function init() {
  Convenience.initTranslations();
}