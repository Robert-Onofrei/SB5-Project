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

- **OneNote:** https://atlantictu-my.sharepoint.com/:o:/r/personal/g00415420_atu_ie/Documents/ProjectManagment/SB5?d=wf632b782682c478387b3c66e87d76b2d&csf=1&web=1&e=nVhFN2
- **Jira:** https://sb5.atlassian.net/jira/software/projects/HELIOS/summary
- **Demo:** [INSERT LINK]

---

## How to Clone

```bash
