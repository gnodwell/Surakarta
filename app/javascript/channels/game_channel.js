import consumer from "./consumer"

consumer.subscriptions.create("GameChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("HELLO RAILS");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('#messages').append('<p class="received"> ' + data.message + '</p>')
  },

  speak(message) {
    this.perform('speak', { message: message })
  }
});
