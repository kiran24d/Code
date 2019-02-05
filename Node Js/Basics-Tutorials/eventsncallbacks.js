/*Functions that listen to events act as Observers. Whenever an event gets fired, its listener function starts executing.

Import events module */
const events = require('events');

/* Create object of EventEmitter*/
let eventEmitter = new events.EventEmitter();

/*Create Event Handler */
let eventHandler = () => {

    console.log("Connection initiated");
    /*SYNTAX : eventEmitter.emit('eventName'); */
    eventEmitter.emit('received');
}

/*Bind the connection Event with event Handler
SYNTAX : eventEmitter.on('eventName', eventHandler);
*/
eventEmitter.on('Connected', eventHandler);

/*Bind the receieved event with anonymus function */
eventEmitter.on("received", () => {
    console.log("data received successfully");
});

/*this event calls event emitter on line 20 which in turn calls event handler  at line 10 and it prints the message . after that it emits another event at line 13 which in turn calls even handler at 23 and it executes it as anon function. */
eventEmitter.emit('Connected');

console.log("Finished");