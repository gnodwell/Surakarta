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
    console.log("recieved message.")
    document.getElementById("messages").innerHTML += data.html
  },

  speak(message) {
    this.perform('speak', { message: message })
  }
});
