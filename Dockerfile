# Start from the official ROS Jazzy base image
FROM ros:jazzy

# Install ROS-Gazebo integration packages and common dev tools
RUN apt-get update && \
    apt-get install -y \
    ros-jazzy-gz-* \
    git \
    nano \
    vim \
    python3-pip \
    build-essential \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Set up a workspace directory
RUN mkdir -p /root/ros_ws
WORKDIR /root/ros_ws

# Set environment variables for GUI apps
ENV QT_X11_NO_MITSHM=1

# Default to bash shell
CMD ["bash"]
