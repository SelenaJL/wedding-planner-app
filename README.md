# Wedding Planner App

## Goal

This app aims to empower couples to plan their own wedding with clairty, confidence, and joy! It's designed to solve the fragmented, chaotic experience of tracking information accross multuple spreadsheets, notes, emails, etc. by bringing everything into one cohesive space.

## Features

- Users can create a secure account to access their saved data. In the future, they will be able to add other user types with limited access to their account so they can share specific information and collaborate with friends/family/vendors.
- When logged in, users see a dashboard linking to tools for event planning, guest list management, and day-of coorindation. In the future, they will be able to customize this view by hiding tools that aren't relevent to their needs.
- Each tool comes with smart defaults and the ablity to export data to a CSV or PDF. More about the tools below...

### Event planning tools

- Checklist (choose a 6 to 24 month timeline, add events Google Calendar)
- Budgeting (suggest categories, track spending/payments)
- Venue selection (create comparison chart)
- Vendor selection (track details for officiant, florist, DJ, photographer, videography, caterer, etc.)

### Guest list management tools

- Contact information (track names, emails, and addresses)
- Outreach (send virtual save the dates, invitations, reminders, and thank you cards)
- RSVPs (track responses including things like dietary restrictions, travel/accommodation preferences, etc.)
- Seating chart (create based on table size and family groupings/priority)
- Gifts (track sender and item)

### Day-of coordination tools

- Timeline (suggest timing of events from getting ready to ceremony to reception, coordinate people involved)
- Decor (track sourcing, set up, and take down)
- Music (create Spotify playlists)
- Ceremony (write script for processional, opening, readings, statement of intent, vow exchange, ring exchange, signing marriage license, closing, and recessional)
- Shot list (suggest key photos/videos based on events)

Some future tools might include:

- Planning for pre-wedding events like engagement parties, bridal showers, bachelor/bachelorette trips, and rehearsal dinners
- Creating custom wedding websites to share with guests
- Sharing Canva templates for DIYs (invitations, address labels, signage, etc.)
- Sharing Pinterest boards for inspiration (themes, DIYs, keepsakes, etc.)
- A directory to track and review local vendors (through Wedding Wire?)

## Development Setup

This project uses [mise](https://mise.jdx.dev/) for simplified development workflows. All commands are cross-platform and handle dependencies automatically.

### Quick Start

```bash
# Clone the repository
git clone <repository-url>
cd wedding-planner-app

# One-time setup (installs PostgreSQL, gems, creates databases)
mise run setup

# Start the Rails server
mise run start
```

The Rails API will run on `http://localhost:4000` by default

### Available Commands

**Development:**

- `mise run start` - Start Rails development server on port 4000
- `mise run console` - Open Rails console for debugging
- `mise run test` - Run the full test suite

**Database:**

- `mise run db:create` - Create development and test databases
- `mise run db:migrate` - Run pending database migrations
- `mise run db:seed` - Load sample data into database
- `mise run db:reset` - Drop, recreate, migrate, and seed database

**Setup:**

- `mise run setup` - Complete development environment setup

**List available tasks:**

- `mise task` - Show all available tasks with descriptions

### Tech Stack

- **Backend:** Ruby on Rails 7.1 (API mode)
- **Database:** PostgreSQL 14
- **Frontend:** React + TypeScript (separate repository/deployment)
- **Authentication:** Devise + JWT tokens
- **Testing:** Minitest (Rails default)
