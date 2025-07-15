# Wedding Planner App: Comprehensive Plan

## Overview

This document outlines a strategic and technical plan for developing the Wedding Planner App, tailored for a team experienced with Ruby on Rails and React. The primary goal is to rapidly build a production-ready Minimum Viable Product (MVP) with a strong emphasis on testing, followed by iterative development to introduce more advanced features.

## Technology Stack

To leverage the team's existing expertise and accelerate development, the following stack is recommended:

*   **Backend:** **Ruby on Rails**. The convention-over-configuration philosophy and vast ecosystem of gems (e.g., Devise for authentication) will significantly speed up backend development.
*   **Frontend:** **React**. This is an ideal choice for building a modern, responsive, and interactive user interface.
*   **Database:** **PostgreSQL**. This is the default database for Rails in production environments, known for its robustness and reliability.
*   **API:** A **RESTful API** built with Rails will serve as the interface between the backend and the React frontend. This separation of concerns will allow for independent development and scaling of the frontend and backend.
*   **UI Library:** A pre-built React component library like **Material-UI** or **Ant Design** provide a wide range of high-quality, customizable components that will ensure a consistent and professional look and feel without requiring extensive design work.

## Development Milestones (MVP)

The MVP will be developed in three distinct milestones, focusing on core functionality first.

### Milestone 1: Foundation & User Authentication (1 week)

*   **Objective:** Set up the project and implement secure user accounts.

*   **Backend (Ruby on Rails):**
    *   **Models:**
        *   `User(id: integer, email: string, password_digest: string, created_at: datetime, updated_at: datetime)`
    *   **Controllers:**
        *   `Api::V1::UsersController` (for registration)
        *   `Api::V1::SessionsController` (for login/logout)
    *   **API Endpoints:**
        *   `POST /api/v1/users` (for registration)
        *   `POST /api/v1/login`
        *   `DELETE /api/v1/logout`
    *   **Gems:**
        *   `devise_token_auth` or a similar JWT-based authentication gem.

*   **Frontend (React):**
    *   **Components:**
        *   `RegistrationForm`
        *   `LoginForm`
        *   `Dashboard` (a simple layout for logged-in users)
    *   **State Management:**
        *   Use React hooks (`useState`, `useContext`) to manage user authentication state.
    *   **API Interaction:**
        *   Use `axios` or `fetch` to make API requests to the Rails backend.

*   **Testing:**
    *   **RSpec:** Test the `User` model and the authentication endpoints.
    *   **Jest/React Testing Library:** Test the `RegistrationForm` and `LoginForm` components.

### Milestone 2: Core Planning Tools (2 weeks)

*   **Objective:** Build the most essential wedding planning tools.

*   **Checklist:**
    *   **Backend (Ruby on Rails):**
        *   **Models:**
            *   `Checklist(id: integer, user_id: integer, timeline: integer)`
            *   `ChecklistItem(id: integer, checklist_id: integer, task: string, due_date: date, completed: boolean)`
        *   **Controllers:**
            *   `Api::V1::ChecklistsController` (`show`, `update`)
            *   `Api::V1::ChecklistItemsController` (`index`, `create`, `update`, `destroy`)
        *   **API Endpoints:**
            *   `GET /api/v1/checklists/:id`
            *   `PUT /api/v1/checklists/:id`
            *   `GET /api/v1/checklists/:checklist_id/checklist_items`
            *   `POST /api/v1/checklist_items`
            *   `PUT /api/v1/checklist_items/:id`
            *   `DELETE /api/v1/checklist_items/:id`
    *   **Frontend (React):**
        *   **Components:**
            *   `Checklist` (to display and manage the checklist)
            *   `ChecklistItem` (for individual checklist items)
            *   `ChecklistForm` (to add new checklist items)

*   **Budgeting:**
    *   **Backend (Ruby on Rails):**
        *   **Models:**
            *   `Budget(id: integer, user_id: integer, total_budget: decimal)`
            *   `BudgetCategory(id: integer, budget_id: integer, name: string)`
            *   `BudgetItem(id: integer, budget_category_id: integer, name: string, estimated_cost: decimal, actual_cost: decimal)`
        *   **Controllers:**
            *   `Api::V1::BudgetsController` (`show`, `update`)
            *   `Api::V1::BudgetCategoriesController` (`index`, `create`, `update`, `destroy`)
            *   `Api::V1::BudgetItemsController` (`index`, `create`, `update`, `destroy`)
    *   **Frontend (React):**
        *   **Components:**
            *   `BudgetTracker`
            *   `BudgetCategory`
            *   `BudgetItem`
            *   `BudgetForm`

*   **Guest List:**
    *   **Backend (Ruby on Rails):**
        *   **Models:**
            *   `Guest(id: integer, user_id: integer, first_name: string, last_name: string, email: string, rsvp_status: string)`
        *   **Controllers:**
            *   `Api::V1::GuestsController` (`index`, `create`, `update`, `destroy`)
    *   **Frontend (React):**
        *   **Components:**
            *   `GuestList`
            *   `Guest`
            *   `GuestForm`

### Milestone 3: Day-of Coordination Essentials (1 week)

*   **Objective:** Add tools for managing the wedding day itself.

*   **Timeline:**
    *   **Backend (Ruby on Rails):**
        *   **Models:**
            *   `Timeline(id: integer, user_id: integer)`
            *   `TimelineEvent(id: integer, timeline_id: integer, name: string, start_time: time, end_time: time)`
        *   **Controllers:**
            *   `Api::V1::TimelinesController` (`show`)
            *   `Api::V1::TimelineEventsController` (`index`, `create`, `update`, `destroy`)
    *   **Frontend (React):**
        *   **Components:**
            *   `Timeline`
            *   `TimelineEvent`
            *   `TimelineEventForm`

*   **Ceremony Script:**
    *   **Backend (Ruby on Rails):**
        *   **Models:**
            *   `CeremonyScript(id: integer, user_id: integer, content: text)`
        *   **Controllers:**
            *   `Api::V1::CeremonyScriptsController` (`show`, `update`)
    *   **Frontend (React):**
        *   **Components:**
            *   `CeremonyScriptEditor` (using a rich text editor library like Quill or Slate.js)

## Post-MVP Development

After the successful launch of the MVP, the following features from the `README.md` can be prioritized for future iterations:

*   Venue and vendor selection tools.
*   Advanced guest management features (seating charts, gift tracking).
*   Day-of coordination enhancements (decor, music, shot list).
*   Social features (sharing with friends/family/vendors).
*   Custom wedding websites.

## Testing Strategy

A comprehensive testing strategy is crucial for a production-ready application.

*   **Backend (Rails):** Use **RSpec** for unit, integration, and feature testing.
*   **Frontend (React):** Use **Jest** and **React Testing Library** for component and integration testing.
*   **Continuous Integration (CI):** Set up a CI pipeline (e.g., using GitHub Actions) to automatically run the test suites on every push and pull request.

## Deployment

For a simple and efficient deployment process, **Heroku** is the recommended platform.

*   **Why Heroku?** Heroku offers a streamlined deployment experience for Ruby on Rails and React applications, with excellent documentation and a free tier suitable for an MVP. It handles much of the infrastructure management, allowing the team to focus on application development.
*   **Deployment Steps:**
    1.  Create a Heroku account and install the Heroku CLI.
    2.  Create a new Heroku application.
    3.  Configure the application for both the Rails backend and the React frontend (e.g., using buildpacks).
    4.  Deploy the application to Heroku with a single `git push heroku main` command.
