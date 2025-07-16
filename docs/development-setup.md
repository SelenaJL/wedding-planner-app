# Development Setup Guide

This guide covers both Docker and native development setup for the wedding planner app.

## Quick Start (Docker - Recommended)

**Requirements:** Docker with Compose plugin

```bash
git clone <repository-url>
cd wedding-planner-app
mise run docker:up
```

Access the app at `http://localhost:4000`

## Quick Start (Native)

**Requirements:** Ruby 3.4.4, PostgreSQL, [mise](https://mise.jdx.dev/)

```bash
git clone <repository-url>
cd wedding-planner-app
mise run setup
mise run start
```

Access the app at `http://localhost:4000`

## Docker Setup Details

### Installing Docker

**macOS with Homebrew:**
```bash
# Option 1: Docker + Colima (lightweight)
brew install docker colima
colima start

# Option 2: Docker Desktop (full GUI)
brew install --cask docker
```

**Linux:**
```bash
# Ubuntu/Debian
sudo apt install docker.io docker-compose-plugin

# Start Docker daemon
sudo systemctl start docker
sudo systemctl enable docker
```

**Windows:**
- Install [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/)

### Docker Compose Plugin Issue

If you get `docker: unknown command: docker compose`, you need the compose plugin:

```bash
# Install via Homebrew
brew install docker-compose

# Configure Docker to find the plugin
mkdir -p ~/.docker
echo '{"cliPluginsExtraDirs":["/opt/homebrew/lib/docker/cli-plugins"]}' > ~/.docker/config.json

# Verify it works
docker compose --version
```

### Docker Commands

```bash
mise run docker:up    # Start all services
mise run docker:down  # Stop all services  
mise run docker:logs  # View logs
```

### Troubleshooting Docker

**Colima connection issues:**
```bash
# Ensure Colima is running
colima status

# Set Docker context
export DOCKER_HOST="unix://$HOME/.config/colima/default/docker.sock"
```

**Port conflicts:**
```bash
# Check what's using port 4000
lsof -i :4000

# Use different port
docker compose up # Edit docker-compose.yml to change ports
```

## Native Setup Details

### Installing Dependencies

**macOS:**
```bash
# Install mise
brew install mise

# Install PostgreSQL
brew install postgresql@14
brew services start postgresql@14
```

**Linux:**
```bash
# Install mise
curl https://mise.jdx.dev/install.sh | sh

# Install PostgreSQL (Ubuntu/Debian)
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

### Ruby Version Management

This project uses Ruby 3.4.4. Mise will automatically install it when you run setup.

### Database Setup

The setup script handles database creation, but you can run individual commands:

```bash
mise run db:create   # Create databases
mise run db:migrate  # Run migrations
mise run db:seed     # Load sample data
mise run db:reset    # Reset everything
```

### Native Commands

```bash
mise run start       # Start Rails server
mise run console     # Rails console
mise run test        # Run tests
```

## Development Workflow

### Making Changes

**Docker:** Code changes appear instantly via volume mounting
**Native:** Code changes appear instantly with Rails auto-reloading

### Running Tests

**Docker:**
```bash
docker compose exec app bundle exec rails test
```

**Native:**
```bash
mise run test
```

### Database Operations

**Docker:**
```bash
docker compose exec app bundle exec rails console
docker compose exec app bundle exec rails db:migrate
```

**Native:**
```bash
mise run console
mise run db:migrate
```

## Choosing Your Setup

### Use Docker When:
- Setting up on a new machine
- Working with teammates on different operating systems
- Want guaranteed environment consistency
- Preparing for deployment

### Use Native When:
- Faster development iteration
- Need to debug with external tools
- Comfortable managing local dependencies
- Working with IDE integrations

## Common Issues

### Docker Build Fails
```bash
# Clear Docker cache and rebuild
docker compose down
docker system prune -f
mise run docker:up
```

### Native PostgreSQL Issues
```bash
# Check PostgreSQL status
brew services list | grep postgresql

# Restart PostgreSQL
brew services restart postgresql@14
```

### Port Already in Use
```bash
# Find and kill process using port 4000
lsof -ti:4000 | xargs kill -9
```

## Getting Help

- Check container logs: `mise run docker:logs`
- View available tasks: `mise task`
- PostgreSQL logs: `tail -f /opt/homebrew/var/log/postgresql@14.log` (macOS)