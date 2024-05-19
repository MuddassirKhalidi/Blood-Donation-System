# Blood Donation System

This Python module provides the backend logic for a modern centralized Blood Donation System.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Requirements](#requirements)


## Features

- Allows Admin users to Add and Remove Hospitals and Vendors.
- Allows Hospitals to administer blood to patients based on existing Blood Inventory levels.
- Allows Hospitals and Vendors to access centralized patient details without needing to create a new file.
- Allows Vendors to take 20 units of blood from a donor.
- Allows Hospitals to request Blood from Vendors by specifying amount and blood type.
- Allows Vendors to send Blood to Hospitals based on the requests.
- Allows Hospitals and Vendors to Manage staff by Adding and Removing Nurses. 

## Installation

1. Clone or download the repository to your local machine.
2. Ensure you have Python 3.x installed.
3. Install the required `psycopg2` and `tabulate` libraries by running the `get_libraries.py` file.

## Usage

1. Run the `db_setup.py` file to set up the tables and insert 100 nurses, 10 in each vendor.
2. Run the `main.py`.
3. Enter the username and password for your `Postgres` server. 

## Requirements

- Python 3.x
- `psycopg2` library
- `tabulate` library 

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or create a pull request.
