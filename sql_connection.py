import mysql.connector
import hashlib
import streamlit as st

# Hashing function for password
def hash_password(password):
    return hashlib.sha256(password.encode()).hexdigest()

# MySQL connection
def create_connection():
    return mysql.connector.connect(
        host='localhost',
        user='your_username',
        password='your_password',
        database= 'your_database'
    )

# Check if user exists in the customer table (for Login)
def check_old_user(email, password):
    conn = create_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM customers WHERE email = %s", (email,))
    user = cursor.fetchone()
    conn.close()

    # Verify if user exists and password matches
    if user and user['password'] == hash_password(password):
        return user
    return None


# Add new customer
def add_new_customer(name, email, mobile, city, state, password):
    try:
        conn = create_connection()
        cursor = conn.cursor()
        hashed_password = hash_password(password) # Store hashed password

        # check if customer already exists by email
        cursor.execute("SELECT * FROM customers WHERE email = %s", (email, ))
        existing_customer = cursor.fetchone()

        if existing_customer:
            return st.error("This email is already exists. Please log in as an old user.")


        cursor.execute("""
            INSERT INTO customers (name, email, mobile, city, state, password)
            VALUES (%s, %s, %s, %s, %s, %s)
        """, (name, email, mobile, city, state, hashed_password))
        conn.commit()

    except mysql.connector.Error as error:
        conn.rollback()
        print(f"Failed to insert customer record: {error}")
        return "Error occurred while creating the customer. Please try again."

    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()

# Get product data from the product table
def get_product_data(category=None, filters=None):
    conn = create_connection()
    cursor = conn.cursor(dictionary=True)

    # Base query
    query = "SELECT * FROM product WHERE"
    params = []

    # Add category to query
    if category:
        query += f" category = '{category}'"


    # Add other filters (processor, RAM, graphics) using LIKE
    if filters:
        if "processor" in filters:
            query += f" AND processor LIKE '%{filters['processor']}%'"
        if "ram" in filters:
            query += f" AND ram LIKE '{filters['ram']}%'"
        if "graphics" in filters:
            query += f" AND graphics LIKE '%{filters['graphics']}%'"

    print(params)
    print(query)


    cursor.execute(query, params)
    products = cursor.fetchall()
    conn.close()

    # # Check if the query returned no products
    if not products:
        return "No results found."
    else:
        return products

# Check if transaction exists for the logged-in user
def get_transaction_data(customer_id):
    conn = create_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM transactions WHERE customerid = %s", (customer_id,))
    transactions = cursor.fetchall()
    conn.close()
    return transactions