# Wedding Planner App - Development Plan

## MVP Development Milestones

### Milestone 1: Core Authentication & Dashboard (Week 1-2)

**Goal**: Users can create accounts and see a basic dashboard

#### Tasks:

- **Day 1**: Set up Rails API with basic user authentication (Devise)
- **Day 2**: Create React frontend with login/signup forms
- **Day 3**: Implement JWT token authentication between frontend/backend
- **Day 4**: Create basic dashboard layout with navigation
- **Day 5**: Add user profile management (edit name, email, password)

#### Database Schema:

```ruby
# users table
create_table :users do |t|
  t.string :email, null: false
  t.string :encrypted_password, null: false
  t.string :first_name
  t.string :last_name
  t.date :wedding_date
  t.timestamps
end
```

### Milestone 2: Basic Guest List Management (Week 3)

**Goal**: Users can add, edit, and manage their guest list

#### Tasks:

- **Day 1**: Create Guest model and basic CRUD API endpoints
- **Day 2**: Build guest list UI with add/edit/delete functionality
- **Day 3**: Add guest contact information (email, address, phone)
- **Day 4**: Implement search and filtering for guest list
- **Day 5**: Add CSV export functionality for guest list

#### Database Schema:

```ruby
# guests table
create_table :guests do |t|
  t.references :user, null: false, foreign_key: true
  t.string :first_name, null: false
  t.string :last_name, null: false
  t.string :email
  t.string :phone
  t.text :address
  t.string :relationship
  t.boolean :invited, default: false
  t.boolean :rsvp_status
  t.text :dietary_restrictions
  t.timestamps
end
```

### Milestone 3: Simple Budget Tracking (Week 4)

**Goal**: Users can track wedding expenses and set budgets

#### Tasks:

- **Day 1**: Create Budget and Expense models with API endpoints
- **Day 2**: Build budget overview UI with category breakdown
- **Day 3**: Add expense entry form with categories
- **Day 4**: Implement budget vs actual spending visualization
- **Day 5**: Add expense CSV export and basic reporting

#### Database Schema:

```ruby
# budget_categories table
create_table :budget_categories do |t|
  t.references :user, null: false, foreign_key: true
  t.string :name, null: false
  t.decimal :budgeted_amount, precision: 10, scale: 2
  t.timestamps
end

# expenses table
create_table :expenses do |t|
  t.references :budget_category, null: false, foreign_key: true
  t.string :description, null: false
  t.decimal :amount, precision: 10, scale: 2, null: false
  t.date :date_paid
  t.string :vendor
  t.timestamps
end
```

### Milestone 4: Basic Checklist Tool (Week 5)

**Goal**: Users can track wedding planning tasks with a timeline

#### Tasks:

- **Day 1**: Create Checklist and Task models
- **Day 2**: Build checklist UI with task management
- **Day 3**: Add pre-populated tasks based on wedding timeline
- **Day 4**: Implement task completion tracking and progress indicators
- **Day 5**: Add custom task creation and deadline management

#### Database Schema:

```ruby
# checklists table
create_table :checklists do |t|
  t.references :user, null: false, foreign_key: true
  t.string :name, null: false
  t.timestamps
end

# tasks table
create_table :tasks do |t|
  t.references :checklist, null: false, foreign_key: true
  t.string :title, null: false
  t.text :description
  t.date :due_date
  t.boolean :completed, default: false
  t.integer :priority, default: 1
  t.timestamps
end
```

### Milestone 5: MVP Polish & Deployment (Week 6)

**Goal**: Deploy a working MVP that friends can use

#### Tasks:

- **Day 1**: Add responsive design improvements
- **Day 2**: Implement basic error handling and user feedback
- **Day 3**: Add data validation and security improvements
- **Day 4**: Set up production deployment (see deployment guide below)
- **Day 5**: User testing with your friend and bug fixes

## Tech Stack Recommendations

### Backend (Rails API)

- **Focus**: User authentication, data models, API endpoints
- **Key Components**: Devise for auth, PostgreSQL for database, JWT tokens
- **Skip for MVP**: Complex permissions, real-time features, external integrations

### Frontend (React + TypeScript)

- **Focus**: User interface, form management, data visualization
- **Key Components**: React Router, Axios for API calls, basic CSS/styled-components
- **Skip for MVP**: Complex animations, mobile app, advanced charts

### Database (PostgreSQL)

- **Focus**: User data, relationships between entities
- **Key Tables**: users, guests, budget_categories, expenses, checklists, tasks
- **Skip for MVP**: Complex queries, data analytics, caching

## Deployment Resources

### Recommended Hosting Options:

1. **Heroku** (Easiest for Rails/React)

   - Rails backend on Heroku with PostgreSQL addon
   - React frontend on Netlify or Vercel
   - Cost: ~$7/month for hobby tier

2. **Railway** (Modern alternative)

   - Full-stack deployment
   - Built-in PostgreSQL
   - Cost: ~$5/month

3. **DigitalOcean App Platform**
   - Good middle ground between ease and control
   - Cost: ~$12/month

### Deployment Checklist:

- [ ] Set up environment variables for production
- [ ] Configure CORS for frontend-backend communication
- [ ] Set up SSL certificates
- [ ] Configure database backups
- [ ] Set up basic monitoring (Sentry for error tracking)

## UX/Design Resources (No Figma Required)

### Design Tools for Beginners:

1. **Canva** - Great for creating simple mockups and graphics
2. **Excalidraw** - Perfect for wireframing and flow diagrams
3. **Whimsical** - Good for user flows and simple wireframes
4. **Pen & Paper** - Don't underestimate sketching!

### Design Process:

1. **Start with user flows** - Map out how users will navigate your app
2. **Create wireframes** - Simple boxes and lines to show layout
3. **Find inspiration** - Look at other wedding planning tools (The Knot, Zola)
4. **Use existing UI libraries** - Consider React Bootstrap or Tailwind CSS
5. **Focus on usability** - Simple, clear interfaces over fancy designs

### Design Resources:

- **Unsplash** - Free stock photos
- **Heroicons** - Simple, clean icons
- **Google Fonts** - Free typography
- **Coolors.co** - Color palette generator

## Next Steps After MVP

### Phase 2 Features:

- RSVP management system
- Vendor comparison tool
- Basic timeline/day-of coordination
- Email invitations

### Phase 3 Features:

- Seating chart tool
- Advanced budgeting with payment tracking
- Mobile responsiveness improvements
- User collaboration features

## Success Metrics for MVP:

- Users can create accounts and log in
- Users can manage a guest list of 50+ people
- Users can track expenses across 5+ budget categories
- Users can complete a 20+ item wedding checklist
- Friend can use the app for their own wedding planning

## Development Tips:

- Start with the most basic version of each feature
- Focus on data accuracy over fancy UI
- Get feedback early and often
- Keep the scope small - resist feature creep
- Test with real wedding planning data
