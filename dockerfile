# 1. Use an official lightweight Python image
FROM python:3.9-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy the current directory contents into the container at /app
COPY . /app

# 4. Install dependencies (Flask, Flask-SocketIO)
RUN pip install --no-cache-dir -r requirements.txt

# 5. Expose port 5000 (the default Flask port)
EXPOSE 5000

# 6. Set environment variables for Flask (optional but recommended)
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# 7. Command to run the application
CMD ["flask", "run"]