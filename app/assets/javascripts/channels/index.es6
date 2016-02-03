var App = {};
App.cable = ActionCable.createConsumer('ws://localhost:23000');