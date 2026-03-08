# EV India Market Intelligence Portal

An end-to-end data science project designed to analyze and visualize the Indian Electric Vehicle (EV) landscape. This project bridges the gap between global market trends and local adoption challenges, providing a data-driven narrative on how 9 core brands are currently shaping the future of mobility in India.

## Project Purpose

The primary objective of this project is to solve the "information gap" in the Indian EV sector. By integrating global benchmarking data with local sales and infrastructure metrics, the portal identifies:

- Why only 9 out of 33 global brands have successfully entered the Indian mass market.
- The correlation between price, battery range, and consumer adoption.
- The geographic concentration of charging infrastructure across Tier-1 cities.

---

## Features

- **Interactive Data Story**: A guided Tableau Story that walks users through the market transition from a global to a local perspective.
- **Live Analytics Dashboard**: A deep-dive tool with interactive filters for Brand, Region, and Price segments.
- **Regional Heatmaps**: Visual representation of charging station density and market penetration.
- **Price-to-Range Analysis**: Scatter plots identifying the "Sweet Spot" (high range, low cost) for Indian consumers.
- **Responsive Web Interface**: A modern Flask-based portal built with Bootstrap 5 for seamless viewing on desktop and mobile devices.

---

## Technical Implementation

### Architecture

The project follows a classic Full-Stack Data Science architecture:

1. **Data Layer**: MySQL database (`ev_analysis`) for structured storage and complex relational views.
2. **Visualization Layer**: Tableau Public for advanced data storytelling and interactive GUI components.
3. **Application Layer**: Flask (Python) backend handling routing and template rendering.
4. **Presentation Layer**: HTML5, CSS3, and Bootstrap 5 for a "Tech-Startup" aesthetic.

### Technologies Used

- **Languages**: Python 3.x, SQL.
- **Frameworks**: Flask (Web), Bootstrap 5 (UI).
- **Database**: MySQL 8.0.
- **Tools**: Tableau Public, MySQL Workbench, Pandas.

### Prerequisites

- Python 3.10+
- MySQL Server
- A modern web browser (Chrome/Edge recommended for Tableau rendering)

# Step by Step Development

## Phase 1: Problem Identification & Setup

Defining the Scope: We identified the "33 vs. 9" brand gap—why global EV variety doesn't match Indian market reality.

Hardware & Environment Setup: Configured the development environment and ensured the MySQL server was active for data storage.

## Phase 2: Data Acquisition & Engineering

Data Collection: Gathered four primary datasets: EV database.csv,Electric vehicle charging station list.csv,Electric car data.csv,EV India.csv

Database Integration: Imported raw CSVs into the ev_analysis database in MySQL Workbench.

### SQL Data Cleaning:

Handled NULL values in Body Type and Boot Space.

Created a Unified View (view_ev_clean) using UNION ALL to standardize the different columns from Indian and Global data.

## Phase 3: Visual Analytics (Tableau)

Data Extraction: Connected the Mysql server to tableau via bridge drivers.

Building Visuals: Created the Regional Heatmap, Price vs. Range Scatter Plot, and Brand Treemaps etc.

Storytelling: Combined individual sheets into a Tableau Story to create a narrative flow.

Cloud Publishing: Successfully uploaded the workbook to Tableau Public to generate the web-ready Embed Codes.

## Phase 4: Web Development (Flask)

Backend Routing: Developed app.py to handle three core routes: / (Home), /story (Narrative), and /dashboard (Analytics).

Frontend Design: Built a professional UI using Bootstrap 5, focusing on a "Tech-Startup" aesthetic with a dark navbar and responsive cards.

Integration: Pasted the Tableau JavaScript snippets into the HTML templates to embed the live dashboards directly into the website.

## Phase 5: Finalization & Documentation

Project Report: Compiled the step-by-step documentation following the Template
