from flask import Flask, render_template
from flask_socketio import SocketIO, send

app = Flask(__name__)
app.config['SECRET_KEY'] = 'your_secret_key'
socketio = SocketIO(app)

# Serve the chat page
@app.route('/')
def chat():
    return render_template('chat.html')

# Handle messages sent via the WebSocket
@socketio.on('message')
def handleMessage(msg):
    print('Message: ' + msg)
    send(msg, broadcast=True)  # Broadcasts the message to all clients
    return None

if __name__ == '__main__':
    socketio.run(app)
    