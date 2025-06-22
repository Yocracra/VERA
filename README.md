# VERA Docker Environment

## Overview

This project uses Docker Compose and a custom Dockerfile to provide a consistent ROS Jazzy + Gazebo Harmonic development environment with GUI support for both Linux and Windows users. All dependencies and common dev tools are pre-installed in the image for fast, reproducible setup. Environment variables are managed via a `.env` file, which is unique to each developer and not committed to the repository.

---

## Quick Start

For your first time running, go through [Platform-Specific Setup](#Platform-Specific Setup) first.

1. **Copy the Example Environment File**
   ```bash
   cp .env.example .env
   ```
2. **Edit `.env` for Your OS**
   - See the platform-specific instructions below.
3. **Build the Docker Image**
   ```bash
   docker compose build
   ```
4. **Start the Docker Environment**
   ```bash
   docker compose up
   ```

---

## Testing X11 Forwarding (Linux)

To verify that your X11 forwarding is working, you can run a simple X11 application inside the container:

1. Start your container as usual:
   ```bash
   docker compose up
   ```
2. In the container shell, install x11-apps (if not already installed):
   ```bash
   apt-get update && apt-get install -y x11-apps
   ```
3. Run a test X11 app:
   ```bash
   xeyes
   ```
   If a window with moving eyes appears on your host, X11 forwarding is working!

You can also use `xclock` or any other simple X11 app for testing.

---

## Platform-Specific Setup

### Linux

1. Run `xhost +local:docker` on your host to allow Docker containers to use your X server (for GUI apps). You may also need to add `/tmp/.X11-unix` to the "File Sharing" list in Docker Desktop settings.
2. In your `.env` file, set:
   ```
   DISPLAY=:0
   UID=1000
   GID=1000
   ```
   Adjust as needed for your system.
3. Build and start the container as above.
4. Run GUI tools (e.g., RViz, Gazebo) inside the container; they will display on your host.

- More info: https://hub.docker.com/_/ros/

### Windows

1. Install Docker Desktop for Windows (WSL2 backend recommended).
2. Install and run an X server (e.g., VcXsrv or Xming) before starting the container.
   - When launching VcXsrv, enable 'Disable access control' for easier setup (or configure access as needed).
3. In your `.env` file, set:
   ```
   DISPLAY=host.docker.internal:0.0
   UID=1000
   GID=1000
   ```
   Adjust UID/GID as needed (or remove the `user` line if not needed on Windows).
4. If not using WSL2, adjust volume paths to use Windows syntax (e.g., `C:/path/to/ros_ws:/root/ros_ws`).
5. Build and start the container as above.
6. Run GUI tools (RViz, Gazebo) inside the container; they should appear on your Windows desktop.

> **Note:** The `xhost` command is not needed on Windows. Ensure your X server allows connections from Docker.

- More details:
  - Docker Desktop WSL2: https://docs.docker.com/desktop/windows/wsl/
  - VcXsrv: https://sourceforge.net/projects/vcxsrv/
  - Xming: https://sourceforge.net/projects/xming/

---

## Environment File Management

- The `.env` file is listed in `.gitignore` and will not be committed to the repository.
- Use `.env.example` as a template for your own `.env` file.
- Refer to comments in `.env.example` for further guidance.

---

For further help, see the comments in `.env.example` or contact your team lead.
