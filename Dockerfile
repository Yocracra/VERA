# Start from the official ROS Jazzy base image
FROM ros:jazzy

# Update and upgrade to address vulnerabilities, then install required packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    gazebo-harmonic \
    ros-jazzy-gz-* \
    git \
    nano \
    vim \
    python3-pip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set up a workspace directory
RUN mkdir -p /root/ros_ws
WORKDIR /root/ros_ws

# Set environment variables for GUI apps
ENV QT_X11_NO_MITSHM=1

# Default to bash shell
CMD ["bash"]
