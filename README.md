# E-Notes-Manegment-System

🧩 Overview

The Advance Java E-Notes Project is a web-based application developed using Java, JSP/Servlets, and MySQL.
It allows users (students and educators) to create, manage, and share electronic notes efficiently.
The main goal of this project is to simplify academic note management and make learning materials easily accessible anytime, anywhere.

🚀 Features

✅ User Authentication – Login & Registration system for students and admins
✅ Create / Edit / Delete Notes – Full CRUD functionality
✅ View Notes – Organized list of saved notes
✅ Search Notes – Find notes quickly by title or content
✅ Download Notes (PDF) – Export notes for offline use
✅ Admin Panel – Manage users and notes
✅ Responsive UI – Clean and user-friendly design using HTML, CSS, and Bootstrap

🛠️ Technologies Used
| Layer        | Technology                         |
| ------------ | ---------------------------------- |
| **Frontend** | HTML5, CSS3, Bootstrap             |
| **Backend**  | Java, JSP, Servlets                |
| **Database** | MySQL                              |
| **Server**   | Apache Tomcat                      |
| **IDE Used** | Eclipse / IntelliJ IDEA / NetBeans |


📂 Project Structure
Advance-Java-E-Notes/
│
├── src/
│   ├── com.dao/              # Data Access Objects
│   ├── com.entity/           # Entity classes
│   ├── com.servlet/          # Servlet controllers
│   └── com.util/             # Database connection helpers
│
├── WebContent/
│   ├── css/                  # Stylesheets
│   ├── js/                   # JavaScript files
│   ├── images/               # Image assets
│   ├── pages/                # JSP pages (Login, Dashboard, Notes, etc.)
│   └── index.jsp             # Landing page
│
├── lib/                      # JAR dependencies
├── database/
│   └── e_notes.sql           # SQL file for database setup
└── README.md


⚙️ Installation and Setup
🧱 Prerequisites

Make sure you have the following installed:

Java JDK 8+

Apache Tomcat 9+

MySQL Server

Eclipse / IntelliJ / NetBeans IDE


🔧 Steps to Run

1. Clone or Download this repository.
git clone https://github.com/yourusername/Advance-Java-E-Notes.git

2. Import the project into your IDE as a Dynamic Web Project.
3. Set up the Database:
Create a new database in MySQL:
CREATE DATABASE e_notes;

Import the provided e_notes.sql file from the /database folder.
4. Update Database Credentials in the file:
com/util/DBConnect.java

Example:
String url = "jdbc:mysql://localhost:3306/e_notes";
String username = "root";
String password = "yourpassword";

5. Run the Project on Apache Tomcat server.
6. Open your browser and go to:
   http://localhost:8080/Advance-Java-E-Notes/


🧑‍💻 Modules
👨‍🎓 Student Module
Register / Login
Add / Edit / Delete Notes
View All Notes
Search Notes by Title
Download Notes

👨‍🏫 Admin Module
View All Users
Manage Notes
Delete Inappropriate Content
   
🧠 Learning Outcomes
Implementation of JSP, Servlets, and JDBC
Understanding MVC architecture in Java Web Applications
Database connectivity using MySQL
CRUD operations in Advance Java
Session management & authentication
Deployment on Apache Tomcat

🤝 Contributors
👤 Sumeet Pethkar
📍 Pune, India
🎓 Computer Engineering
💻 Skills: HTML, CSS, JS, Bootstrap, React JS, Java






