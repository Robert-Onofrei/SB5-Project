# FáilteGo

**Discover the Galway you didn't know was there.**

FáilteGo is a mobile tourism app designed to help tourists discover the deeper cultural side of Galway. Visitors often miss hidden gems because information is spread across different platforms. FáilteGo brings it all together in a single app with curated cultural trails, interactive maps and attraction discovery.

---

## Problem Statement and Target Users

Tourists visiting Galway rely on scattered websites, outdated brochures and generic search results to plan their trips. There's no single app that brings together cultural trails, heritage sites and local attractions in one place with map based navigation.

**Target users:** Tourists and visitors who want to explore Galway beyond the standard travel guides.

---

## Key Features Implemented

- Home page with cultural trail cards and discover nearby section
- Interactive trail maps using OpenStreetMap with pinned stops and route lines
- Trail detail screens with stop descriptions and progress tracking
- Mark trail stops as visited
- Attraction browsing with search and category filtering
- No search results handling when nothing matches
- Food and drink page with venue cards, search and category filters
- User registration with email format validation
- Login screen
- Profile screen with logout
- Map view showing all pinned attraction locations across Galway
- Historical information at locations
- Saving favourites

---

## Architecture Overview

FáilteGo uses a three tier architecture. The Flutter mobile app handles all the UI and map rendering on the client side. It communicates with a Node.js Express backend through REST API calls. The backend handles user authentication using bcryptjs for password hashing and jsonwebtoken for session management. User data is stored in a MongoDB Atlas cloud database connected through Mongoose.

---

## Technology Stack

| Layer | Technologies |
|-------|-------------|
| Frontend | Flutter (Dart), flutter_map, latlong2, OpenStreetMap tiles |
| Backend | Node.js, Express |
| Database | MongoDB Atlas, Mongoose |
| Authentication | bcryptjs, jsonwebtoken |
| CI | GitHub Actions |

---

## Team Members and Scrum Roles

| Name | Student ID | Role |
|------|-----------|------|
| Fionn Qualter | G00428202 | Scrum Master |
| Nusrathara Hanif | G00415420 | Product Owner |
| Robert Onofrei | G00432495 | Developer |
| Zakaria Kebayli | G00434173 | Tester |

---

## Links

- **OneNote:** https://atlantictu-my.sharepoint.com/:o:/r/personal/g00415420_atu_ie/Documents/ProjectManagment/SB5?d=wf632b782682c478387b3c66e87d76b2d&csf=1&web=1&e=gjeND9
- **Jira:** https://sb5.atlassian.net/jira/software/projects/HELIOS/summary
- **Demo:** [INSERT LINK]

---

## How to Clone

```bash
git clone https://github.com/Robert-Onofrei/SB5-Project.git
cd SB5-Project
```

---

## How to Build and Run

### Prerequisites

- Git installed
- Flutter SDK installed (install via VS Code extensions, when prompted install the SDK at the base level of your drive)
- Node.js installed (download from the Node.js website)
- Android Studio installed with Android SDK and emulator
- VS Code or another code editor

> Run `flutter doctor --android-licenses` and `flutter doctor` in the terminal to check for missing components.

### Run the backend

```bash
cd backend
npm install
node server.js
```

You should see "MongoDB connected" and "Server running on port 5000". Leave this terminal running.

### Run the frontend

Open a new terminal.

```bash
cd frontend
flutter pub get
flutter run
```

Make sure your Android emulator is running in Android Studio Device Manager before running `flutter run`.

---

## How to Run Test Harness and Execute Automated Tests

```bash
cd frontend
flutter test
```

This runs all widget and unit tests in the test directory. Tests cover the main screens and validation logic. All tests should show green (passing) results.

---

## How to Perform Kit Build

The CI pipeline runs automatically on every pull request via GitHub Actions. It builds both the Flutter frontend and the Node.js backend and executes the test suite. You can view the build status and logs in the **Actions** tab on GitHub.

To trigger a kit build manually, open a pull request against main.

To run a local kit build:

```bash
cd frontend
flutter build apk
```

```bash
cd backend
npm install
node server.js
```
