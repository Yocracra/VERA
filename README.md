# VERA Docker Environment

## Setup Instructions

This project uses a `.env` file to configure environment variables for Docker Compose. To ensure a smooth setup for all team members (Linux and Windows), follow these steps:

### 1. Copy the Example Environment File

Copy `.env.example` to `.env` in the project root:

### 2. Edit `.env` for Your Operating System

- **Linux users:**
  - Uncomment and adjust the `DISPLAY`, `UID`, and `GID` variables as needed.
- **Windows users:**
  - Uncomment the Windows-specific `DISPLAY`, `UID`, and `GID` lines and adjust as needed.

Refer to the comments in `.env.example` for guidance.

### 3. Keep Your `.env` File Local

- The `.env` file is listed in `.gitignore` and will not be committed to the repository.
- Your local changes to `.env` are safe and will not be overwritten when pulling updates.

### 4. Start the Docker Environment

Run the following command to start the environment:

```bash
docker-compose up
```

---

For further details, see the comments in `.env.example` or contact your team lead.
