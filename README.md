# Data Modelling with PostgreSQL

This repository contains the design and implementation of a school management system using dimensional data modelling with PostgreSQL.

## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
- [Setup](#setup)
- [Data Modelling](#data-modelling)
- [Uploading CSV Files](#uploading-csv-files)
- [Contributing](#contributing)
- [License](#license)

## Introduction
This project demonstrates the design of a school management system using dimensional data modelling techniques. The data model is implemented in PostgreSQL, a powerful open-source relational database management system.

## Requirements
- PostgreSQL
- psql (PostgreSQL command-line tool)

## Setup

1. **Clone the Repository**:
   ```sh
   git clone https://github.com/Mamiololo01/data_modelling_with_postgres.git

   cd data_modelling_with_postgres

2. **Create a new database**:

     CREATE DATABASE school_management;

3. **Connect to the Database**:

    \c school_management

4. **Create Tables**:

    Use the SQL scripts provided in the repository to create the necessary tables. For example:

   CREATE TABLE DimTeacher (
      TeacherID SERIAL PRIMARY KEY,
      FirstName VARCHAR(50),
      LastName VARCHAR(50),
      Subject VARCHAR(50)
    );

5. **Data Modelling**:

   The project uses dimensional data modelling to design the school management system. This approach involves creating fact and dimension tables to organize data in a way that supports efficient querying and reporting.

**Star Schema Design**

   A star schema was designed for this project. The img folder contains images of the conceptual, logical, and physical designs.

   Example Tables

   DimTeacher: Stores information about teachers.

   DimStudent: Stores information about students.

   FactEnrollment: Stores enrollment data linking students and teachers.

**Uploading CSV Files**

To upload data from a CSV file into a PostgreSQL table, you can use the COPY command. For example, to upload data into the DimTeacher table using psql:

COPY DimTeacher FROM '/path/to/your/csvfile.csv' DELIMITER ',' CSV HEADER;

Replace /path/to/your/csvfile.csv with the actual path to your CSV file.

**Contributing**

We welcome contributions to this project. Please follow these steps to contribute:

Fork the Repository:

Click the "Fork" button in the top-right corner of the repository page to create a copy of the repository in your GitHub account.

Clone the Forked Repository:

git clone https://github.com/your-username/data_modelling_with_postgres.git

cd data_modelling_with_postgres

**Create a New Branch**:

git checkout -b my-feature

**Make Your Changes**:

Implement your changes or additions to the repository code. Ensure your code follows the existing code style and includes necessary documentation.

Commit and Push Your Changes:

git add .

git commit -m "Description of the changes"

git push origin my-feature


**Create a Pull Request**:

Go to your forked repository on GitHub and click on the "Compare & pull request" button to create a pull request to the original repository.

**License**:

This project is licensed under the MIT License - see the LICENSE file for details.

Feel free to open an issue or contact the maintainers if you have any questions or need assistance.


