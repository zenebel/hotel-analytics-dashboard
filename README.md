# Hotel Analytics Dashboard

A full-stack analytics platform for hotel chain management, built to demonstrate professional web development and data analysis skills.

## Project Overview

**Business Context**: Analytics dashboard for a mid-sized hotel chain (15-20 properties) to track performance, optimize operations, and make data-driven decisions.

**Technical Stack**:

- **Frontend**: React.js with modern UI components
- **Backend**: Node.js with Express.js REST API
- **Database**: PostgreSQL with complex relational data
- **Data Analysis**: Python with pandas, matplotlib, and statistical analysis
- **Deployment**: Production-ready configuration

## Key Features

### Dashboard Analytics

- Real-time occupancy rates across all properties
- Revenue analytics with interactive visualizations
- Guest satisfaction trends and sentiment analysis
- Booking patterns and seasonal forecasting
- Staff performance metrics and KPIs

### Technical Capabilities

- RESTful API architecture
- Data validation and business logic
- User authentication and role-based access
- Performance optimization
- Comprehensive error handling

## Development Progress

### Phase 1: Foundation

- [x] Project structure setup
- [x] Git repository initialization
- [x] Development environment configuration
- [x] GitHub repository connection
- [x] Professional documentation

### Phase 2: Database Design

- [x] Entity relationship modeling
- [x] PostgreSQL schema creation
- [x] Database connection setup
- [x] Performance indexes implementation
- [x] Business intelligence views
- [x] Data validation and constraints

### Phase 3: Sample Data Population

- [x] Hotel chain data creation
- [x] Guest and reservation records
- [x] Staff and review data
- [x] Analytics data population

### Phase 4: Backend Development (In Progress)

- [ ] Express.js server setup
- [ ] REST API endpoints
- [ ] Authentication middleware
- [ ] Data validation layers

### Phase 5: Frontend Development (Planned)

- [ ] React application structure
- [ ] Component architecture
- [ ] State management
- [ ] Interactive charts and dashboards

### Phase 6: Data Analysis (Planned)

- [ ] Python analysis scripts
- [ ] Statistical modeling
- [ ] Predictive analytics
- [ ] Automated reporting

## Getting Started

### Prerequisites

- Node.js v20.13.1+
- Python 3.10.7+
- PostgreSQL 17.5+
- VS Code with recommended extensions

### Installation

```bash
# Clone the repository
git clone https://github.com/zenebel/hotel-analytics-dashboard.git
cd hotel-analytics-dashboard

# Database setup
psql -d hotel_analytics -f database/schema.sql

Database Architecture
8 Core Tables:

hotels - Property master data
room_types - Room categories and pricing
rooms - Individual room inventory
guests - Customer information and preferences
reservations - Booking and transaction records
reviews - Guest feedback and ratings
staff - Employee management
occupancy_analytics - Daily performance metrics

Key Business Metrics:

Occupancy Rate: (Occupied Rooms / Total Rooms) × 100
RevPAR: Revenue Per Available Room
Average Daily Rate (ADR)
Guest Satisfaction Index

Learning Objectives
This project demonstrates:

Full-stack web development proficiency
Database design and optimization
Data analysis and visualization
Professional development practices
Cross-functional team collaboration skills

Technical Implementation
PostgreSQL Features Used:

Complex foreign key relationships
Generated columns for calculated fields
Array data types for amenities/preferences
Performance indexes for query optimization
Business intelligence views

Professional Development Practices:

Git version control with meaningful commits
Comprehensive documentation
Structured project organization
Code review and testing preparation


Developer: Lydia Z
GitHub: https://github.com/zenebel/hotel-analytics-dashboard
Started: June 14, 2025
Status: Active Development - Database Schema Complete
```
