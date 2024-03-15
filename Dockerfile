# Define the base image
FROM kasmweb/desktop:1.14.0

# Expose port
EXPOSE 6901

# Set environment variable
ENV VNC_PW=zlSvLT5E23ARKq5HESl0zzMT5wUdQETSDi+dutUsWzU=

# Set working directory
WORKDIR /app

# Run the VNC server
CMD ["vncserver", ":1", "-geometry", "1280x720", "-depth", "24"]



