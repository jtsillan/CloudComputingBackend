# Use an official Python runtime as a parent image
FROM python:3.12-bullseye

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
# Use --no-cache-dir to prevent caching cause issues
# Use --progresss-bar off due to bug in Docker image deployment beeing singlethread --> progress bar is multithread
RUN pip install --no-cache-dir --progresss-bar off -r requirements.txt

# Make port available to the world outside this container
EXPOSE 8080

# Run app.py when the container launches
CMD ["python", "app.py"]