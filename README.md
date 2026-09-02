# 🗳️ Voting Application - Full Stack Voting System

A full-stack voting application built with a **Flutter frontend** and a **Node.js/Express backend**, using **MongoDB** for data persistence and **JWT authentication** for secure user access.

The application allows users to register, authenticate, view candidates, and cast their vote while ensuring that each voter can vote only once.

![Flutter](https://img.shields.io/badge/Flutter-3.10+-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-green?logo=dart)
![Node.js](https://img.shields.io/badge/Node.js-Express-green?logo=node.js)
![MongoDB](https://img.shields.io/badge/MongoDB-Mongoose-green?logo=mongodb)
![JWT](https://img.shields.io/badge/Auth-JWT-orange?logo=jsonwebtokens)

---

## 📋 Table of Contents

* [Overview](#-overview)
* [Features](#-features)
* [Tech Stack](#-tech-stack)
* [Application Architecture](#-application-architecture)
* [Prerequisites](#-prerequisites)
* [Installation](#-installation)
* [Project Structure](#-project-structure)
* [Configuration](#-configuration)
* [API Endpoints](#-api-endpoints)
* [Authentication](#-authentication)
* [Voting Flow](#-voting-flow)
* [Running the Application](#-running-the-application)
* [Troubleshooting](#-troubleshooting)
* [Security](#-security)
* [Contributing](#-contributing)
* [License](#-license)
* [Future Improvements](#-future-improvements)

---

## 📱 Overview

The Voting Application is a full-stack web/mobile voting system designed to demonstrate how a modern client-server application can handle **user authentication, role-based access, candidate management, and secure voting**.

The project consists of two major components:

* **Flutter Frontend** — provides the mobile/web user interface.
* **Node.js Backend** — provides REST APIs, authentication, voting logic, and database access.
* **MongoDB** — stores users, candidates, and voting information.

### Key Highlights

* 🔐 JWT-based user authentication
* 👤 Voter and administrator roles
* 🗳️ Candidate listing
* ✅ One-vote-per-user restriction
* 🔒 Password hashing using bcrypt
* 🍃 MongoDB database with Mongoose
* 📱 Flutter frontend
* 🔄 Provider-based state management
* 🌐 REST API communication
* 📊 Vote-count/result endpoint

> **Note:** This project is intended as a learning/full-stack application and is not designed to serve as a production-grade election system.

---

## ✨ Features

### 🔐 Authentication

* ✅ User registration
* ✅ User login using Aadhar ID and password
* ✅ Password hashing using bcrypt
* ✅ JWT token generation
* ✅ JWT token verification
* ✅ One-day token expiration
* ✅ Persistent authentication support through the Flutter application

### 👤 User Roles

The application supports two user roles:

#### Voter

* Register an account
* Login securely
* View candidates
* Cast a vote
* Cannot vote more than once

#### Administrator

* Identified through the `admin` role
* Can access authenticated functionality
* Restricted from casting votes through the voting endpoint

### 🗳️ Candidate Management

* ✅ Retrieve available candidates
* ✅ Display candidate name
* ✅ Display political party
* ✅ Display current vote count
* ✅ Cast a vote for a candidate
* ✅ Track users who voted for a candidate

### 📊 Voting System

* ✅ Authenticated voting
* ✅ One vote per user
* ✅ Prevents an already-voted user from voting again
* ✅ Prevents administrators from voting
* ✅ Records the voter against the selected candidate
* ✅ Stores the voting timestamp
* ✅ Updates candidate vote count
* ✅ Vote-count/result endpoint

### 📱 Flutter Application

* ✅ Flutter-based user interface
* ✅ Provider state management
* ✅ HTTP-based backend communication
* ✅ SharedPreferences for local session/token storage
* ✅ Separate models, providers, services, and screens

---

## 🛠 Tech Stack

### Frontend

* **Framework:** Flutter
* **Language:** Dart
* **State Management:** Provider
* **HTTP Client:** `http`
* **Local Storage:** SharedPreferences
* **UI:** Flutter Material/Cupertino components

### Backend

* **Runtime:** Node.js
* **Framework:** Express.js
* **Language:** JavaScript
* **Authentication:** JSON Web Tokens (JWT)
* **Password Security:** bcrypt
* **Request Parsing:** body-parser
* **CORS:** cors
* **Environment Variables:** dotenv

### Database

* **Database:** MongoDB
* **ODM:** Mongoose

### Development

* **Version Control:** Git
* **Frontend IDE:** Android Studio / VS Code
* **Backend Package Manager:** npm

---

## 🏗️ Application Architecture

The application follows a client-server architecture:

```text
┌──────────────────────────────┐
│       Flutter Frontend       │
│                              │
│  Screens → Providers         │
│              ↓               │
│           Services           │
└──────────────┬───────────────┘
               │ HTTP / REST API
               ▼
┌──────────────────────────────┐
│       Node.js Backend        │
│                              │
│       Express Server         │
│              ↓               │
│           Routes             │
│              ↓               │
│      Authentication          │
│              ↓               │
│          Mongoose            │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│          MongoDB             │
│                              │
│     Users / Candidates       │
└──────────────────────────────┘
```

---

## 📦 Prerequisites

Before running the project, make sure the following software is installed.

### Required Software

1. **Node.js**

   * Node.js and npm are required for the backend.

2. **MongoDB**

   * A running MongoDB instance is required.
   * MongoDB Atlas can also be used.

3. **Flutter SDK**

   * Flutter is required to build and run the frontend.

4. **Dart**

   * Included with Flutter.

5. **Git**

   * Recommended for version control.

### Verify Installation

```bash
node --version
npm --version
flutter --version
dart --version
git --version
```

For Flutter, also run:

```bash
flutter doctor
```

---

## 🚀 Installation

### Step 1: Clone the Repository

```bash
git clone https://github.com/MahapatraA/voting_application.git
cd voting_application
```

---

### Step 2: Configure the Backend

Navigate to the backend:

```bash
cd backend
```

Install dependencies:

```bash
npm install
```

Create a `.env` file:

```env
MONGO_URL=your_mongodb_connection_string
JWT_SECRET=your_jwt_secret
```

> Use the exact MongoDB environment-variable name expected by your backend configuration.

---

### Step 3: Start the Backend

Run:

```bash
npm start
```

The server starts on:

```text
http://localhost:3000
```

The backend exposes the following route groups:

```text
/user
/candidates
```

---

### Step 4: Configure Flutter

Open another terminal and navigate to the frontend:

```bash
cd frontend
```

Install Flutter dependencies:

```bash
flutter pub get
```

Check connected devices:

```bash
flutter devices
```

Run the application:

```bash
flutter run
```

---

## 📁 Project Structure

```text
voting_application/
│
├── backend/
│   │
│   ├── models/
│   │   ├── user.js
│   │   └── candidate.js
│   │
│   ├── routes/
│   │   ├── userRoutes.js
│   │   └── candidateRoute.js
│   │
│   ├── db.js
│   ├── jwt.js
│   ├── server.js
│   ├── package.json
│   └── .env
│
├── frontend/
│   │
│   ├── lib/
│   │   ├── core/
│   │   ├── models/
│   │   ├── providers/
│   │   ├── screen/
│   │   ├── services/
│   │   └── main.dart
│   │
│   ├── android/
│   ├── ios/
│   ├── linux/
│   ├── macos/
│   ├── web/
│   ├── windows/
│   │
│   ├── pubspec.yaml
│   └── analysis_options.yaml
│
└── README.md
```

### Backend Structure

| File/Directory             | Purpose                                      |
| -------------------------- | -------------------------------------------- |
| `server.js`                | Express application entry point              |
| `db.js`                    | MongoDB connection                           |
| `jwt.js`                   | JWT generation and authentication middleware |
| `models/user.js`           | User schema and password handling            |
| `models/candidate.js`      | Candidate and voting schema                  |
| `routes/userRoutes.js`     | Registration and login APIs                  |
| `routes/candidateRoute.js` | Candidate and voting APIs                    |

### Frontend Structure

| Directory    | Purpose                               |
| ------------ | ------------------------------------- |
| `core/`      | Core/shared application functionality |
| `models/`    | Data models                           |
| `providers/` | Application state management          |
| `screen/`    | UI screens                            |
| `services/`  | Backend/API communication             |
| `main.dart`  | Flutter application entry point       |

---

## ⚙️ Configuration

### Backend Environment Variables

Create:

```text
backend/.env
```

Example:

```env
MONGO_URL=mongodb://localhost:27017/voting_application
JWT_SECRET=replace_with_a_secure_secret
```

Never commit your real `.env` file to GitHub.

Use an example file instead:

```text
backend/.env.example
```

```env
MONGO_URL=your_mongodb_connection_string
JWT_SECRET=your_jwt_secret
```

---

### Flutter Backend URL

The Flutter application needs to communicate with the backend.

When running on an Android emulator, remember that:

```text
localhost
```

inside the emulator refers to the emulator itself rather than your development machine.

For an Android emulator, the host machine is commonly accessed through:

```text
10.0.2.2
```

For a physical device, use the development machine's local network IP address.

---

## 🔌 API Endpoints

Base URL:

```text
http://localhost:3000
```

---

### 🔐 Authentication APIs

#### Register User

```http
POST /user/signup
Content-Type: application/json
```

Example request:

```json
{
  "name": "John Doe",
  "age": 25,
  "email": "john@example.com",
  "phoneNumber": "9876543210",
  "address": "Kolkata",
  "aadharId": "123456789012",
  "password": "password123",
  "role": "voter"
}
```

The backend creates the user and returns an authentication token.

---

### Login

```http
POST /user/login
Content-Type: application/json
```

Example request:

```json
{
  "aadharId": "123456789012",
  "password": "password123"
}
```

A successful login returns a JWT token.

The token is subsequently used to access protected endpoints.

---

## 🗳️ Candidate APIs

### Get Candidates

```http
GET /candidates
```

Returns candidate information including:

* Candidate name
* Political party
* Vote count

Example response:

```json
[
  {
    "name": "Candidate A",
    "party": "Party A",
    "votes": 10
  },
  {
    "name": "Candidate B",
    "party": "Party B",
    "votes": 7
  }
]
```

---

### Cast Vote

```http
POST /candidates/vote/:candidateId
Authorization: Bearer <JWT_TOKEN>
```

Example:

```http
POST /candidates/vote/64abc123...
Authorization: Bearer eyJhbGciOi...
```

The endpoint:

1. Verifies the JWT.
2. Identifies the logged-in user.
3. Finds the selected candidate.
4. Checks whether the user is an administrator.
5. Checks whether the user has already voted.
6. Records the vote.
7. Increments the candidate's vote count.
8. Marks the user as having voted.

---

### Get Vote Count

```http
GET /candidates/vote/count
```

Returns candidates/parties ordered according to their vote counts.

Example structure:

```json
[
  {
    "party": "Party A",
    "count": 10
  },
  {
    "party": "Party B",
    "count": 7
  }
]
```

---

## 🔑 Authentication

The application uses **JSON Web Tokens (JWT)** for authentication.

### Authentication Flow

```text
User
 │
 │ Login
 ▼
Flutter Application
 │
 │ POST /user/login
 ▼
Express Backend
 │
 │ Verify Aadhar ID + Password
 ▼
MongoDB
 │
 │ User found
 ▼
JWT Generated
 │
 ▼
Flutter Application
 │
 │ Store token
 ▼
Protected API Requests
 │
 │ Authorization: Bearer <token>
 ▼
JWT Middleware
 │
 │ Verify token
 ▼
Protected Resource
```

JWT tokens generated by the backend expire after **one day**.

---

## 🛡️ Password Security

User passwords are not stored as plain text.

The User model uses **bcrypt** to hash passwords before storing them in MongoDB.

During login:

```text
Password entered by user
          ↓
     bcrypt comparison
          ↓
   Password verified?
       /       \
     Yes        No
      ↓          ↓
 Generate JWT   Reject login
```

---

## 🗳️ Voting Flow

The voting process follows a one-vote-per-user model.

```text
User Login
    │
    ▼
Receive JWT
    │
    ▼
View Candidates
    │
    ▼
Select Candidate
    │
    ▼
Send Authenticated Vote Request
    │
    ▼
Verify JWT
    │
    ▼
Check User Role
    │
    ├── Admin → Reject
    │
    ▼
Check isVoted
    │
    ├── true → Reject
    │
    ▼
Record Vote
    │
    ├── Add user to candidate.votes
    ├── Increment candidate.voteCount
    └── Set user.isVoted = true
    │
    ▼
Vote Successfully Recorded
```

This provides an application-level mechanism to prevent a voter from submitting multiple votes.

---

## 🗄️ Database Models

### User

The User model contains information such as:

```text
name
age
email
phoneNumber
address
aadharId
password
role
isVoted
```

The `aadharId` is configured as unique.

The `role` can be:

```text
voter
admin
```

The `isVoted` field tracks whether the user has already participated in the election.

---

### Candidate

The Candidate model contains:

```text
name
age
party
votes
voteCount
```

Each recorded vote stores:

```text
user
votedAt
```

The voter is referenced through MongoDB's ObjectId relationship with the User model.

---

## ▶️ Running the Application

### Start Backend

Terminal 1:

```bash
cd backend
npm install
npm start
```

Backend:

```text
http://localhost:3000
```

---

### Start Flutter Frontend

Terminal 2:

```bash
cd frontend
flutter pub get
flutter run
```

---

## 🧪 Development Mode

For backend development, `nodemon` can be used:

```bash
npx nodemon server.js
```

This automatically restarts the server when backend files change.

---

## 🐛 Troubleshooting

### "MongoDB connection failed"

Check:

* MongoDB is running.
* The connection string is correct.
* The `.env` file exists.
* The environment variable name matches the backend configuration.
* Your MongoDB network/IP access settings allow the connection.

---

### "JWT authentication failed"

Check:

* `JWT_SECRET` is configured.
* The token has not expired.
* The request contains the Authorization header.

Correct format:

```http
Authorization: Bearer <JWT_TOKEN>
```

---

### "Flutter cannot connect to backend"

If using an Android emulator, don't normally use:

```text
http://localhost:3000
```

Try:

```text
http://10.0.2.2:3000
```

For a physical device, use your computer's local IP address and ensure both devices are on the same network.

---

### "Flutter dependencies are not working"

Run:

```bash
flutter clean
flutter pub get
flutter run
```

---

### "Node modules are missing"

Run:

```bash
cd backend
npm install
```

---

### "Vote cannot be submitted"

Check:

1. The user is logged in.
2. A valid JWT is being sent.
3. The candidate ID is valid.
4. The user has not already voted.
5. The account is not an administrator.
6. The backend is connected to MongoDB.

---

## 🔐 Security

The project includes several application-level security mechanisms:

* 🔒 Password hashing with bcrypt
* 🔑 JWT authentication
* ⏳ JWT expiration
* 👤 Role-based voting restriction
* 🗳️ One-vote-per-user restriction
* 🔐 Environment variables for secrets
* 🗄️ MongoDB schema validation

### Important

This project should **not** be treated as a secure real-world election platform without substantial additional security, auditing, identity verification, infrastructure hardening, and election-integrity controls.

---

## 🤝 Contributing

Contributions and improvements are welcome.

### 1. Fork the Repository

```bash
git clone https://github.com/MahapatraA/voting_application.git
cd voting_application
```

### 2. Create a Feature Branch

```bash
git checkout -b feature/your-feature
```

### 3. Make Your Changes

Follow the existing project structure and coding style.

### 4. Test Your Changes

Backend:

```bash
npm start
```

Frontend:

```bash
flutter run
```

### 5. Commit

```bash
git add .
git commit -m "feat: add your feature"
```

### 6. Push

```bash
git push origin feature/your-feature
```

### 7. Open a Pull Request

Describe:

* What changed
* Why it was changed
* How it was tested

---

## 📄 License

This project is currently intended as a learning/personal full-stack application.

If you decide to distribute it publicly, add an appropriate `LICENSE` file to the repository.

---

## 🚧 Future Improvements

Potential improvements for future versions include:

* 📊 Dedicated election results dashboard
* 👨‍💼 Admin dashboard for candidate management
* ➕ Candidate creation/editing/deletion
* 🔍 Improved input validation
* 🛡️ Rate limiting
* 🔐 More robust authentication and authorization
* 📱 Improved responsive UI
* 🧪 Automated backend tests
* 🧪 Flutter widget/unit tests
* 📋 Election creation and management
* ⏰ Election start/end dates
* 📈 Visual voting statistics
* 🔔 Voting notifications
* 📝 Better API error responses
* 🐳 Docker support
* ☁️ Cloud deployment
* 📚 API documentation with Swagger/OpenAPI

---

## 📊 Project Statistics

### Architecture

* **Frontend:** Flutter
* **Backend:** Node.js + Express
* **Database:** MongoDB
* **Authentication:** JWT
* **Password Hashing:** bcrypt
* **State Management:** Provider
* **API Style:** REST

### Backend API Groups

```text
User
 ├── POST /user/signup
 └── POST /user/login

Candidates
 ├── GET  /candidates
 ├── POST /candidates/vote/:candidateId
 └── GET  /candidates/vote/count
```

---

## 🎓 Learning Objectives

This project demonstrates practical implementation of:

* REST API development
* Flutter application development
* Client-server architecture
* MongoDB database integration
* Mongoose schemas and relationships
* JWT authentication
* Password hashing
* Role-based authorization
* State management with Provider
* HTTP communication between Flutter and Node.js
* One-to-many data relationships
* Basic voting-system business logic

---

## 🙏 Acknowledgments

Built using:

* Flutter & Dart
* Node.js & Express
* MongoDB & Mongoose
* Provider
* bcrypt
* JSON Web Tokens

---

## ⭐ If You Like This Project

If you found this project useful or interesting, consider giving the repository a ⭐ on GitHub.

---

## 👨‍💻 Author

**Anish Mahapatra**

GitHub:

`https://github.com/MahapatraA`

---

## 📝 Project Status

**Version:** 1.0.0
**Status:** 🚧 Learning / Development Project

---

**Made with ❤️ and Flutter + Node.js**

**Happy Voting! 🗳️**
