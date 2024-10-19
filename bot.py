import streamlit as st
import spacy
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from docx import Document
from sql_connection import hash_password, check_old_user, add_new_customer, get_product_data, get_transaction_data

# Load Spacy model for more advanced NLP processing
nlp = spacy.load("en_core_web_sm")

# Greeting and goodbye intents
greetings = ["hello", "hi", "hey", "greetings", "what's up", "howdy", "hai"]
goodbyes = ["bye", "goodbye", "see you", "take care", "later", "farewell"]

# Load the FAQ Document
def load_faq_from_docx(file_path):
    doc = Document(file_path)
    faq = {}
    question = None
    for para in doc.paragraphs:
        if para.text.startswith("Q:"):
            question = para.text[3:].strip() # Extract question
        elif para.text.startswith("A:") and question:
            faq[question] = para.text[3:].strip() # Map question to answer
            question = None
    return faq

def preprocess_sentence_spacy(sentence):
    doc = nlp(sentence)
    processed_tokens = [token.lemma_.lower() for token in doc if not token.is_stop and not token.is_punct and not token.ent_type_]
    return " ".join(processed_tokens)

# Load the FAQ from a word document
file_path = "computer_hardware_faq.docx"
faq_data = load_faq_from_docx(file_path)
faq_questions = list(faq_data.keys())

# Generate TF_IDF vectors for the FAQ questions
vectorizer = TfidfVectorizer()
faq_vectors = vectorizer.fit_transform(faq_questions)

# Function to search FAQ using TF_IDF + cosine similarity
def search_faq_tfidf(user_input, faq, faq_questions, faq_vectors):
    processed_input = preprocess_sentence_spacy(user_input)

    # Transform the user input into a TF_IDF vector
    input_vector = vectorizer.transform([processed_input])

    # Compute cosine similarity between input and faq questions
    similarities = cosine_similarity(input_vector, faq_vectors).flatten()

    # Find the best matching questions (with similarity threshold)
    best_match_idx = similarities.argmax()
    best_match_score = similarities[best_match_idx]

    if best_match_score > 0.4: # Set a threshold to avoid poor matches
        return faq[faq_questions[best_match_idx]]
    else:
        return "I'm sorry, I couldn't find an answer to that. Can you ask something else?"

# Intent detection for greeting and goodbyes
def detect_intents(user_input):
    # Lowercase and preprocess the input
    processed_input = preprocess_sentence_spacy(user_input).split()

    # check for greeting intent
    if any(word in processed_input for word in greetings):
        return "greeting"
    # check for goodbye intent
    if any(word in processed_input for word in goodbyes):
        return "goodbye"
    return "faq"

# Function to generate chatbot responses based on intent and FAQ matching
def get_response(user_input):
    intent = detect_intents(user_input)

    if intent == 'greeting':
        return "Hello! How can I assist you today?"

    elif intent == 'goodbye':
        return "Goodbye! Have a great day!"

    else:
        # FAQ matching using TF_IDF + cosine similairy
        faq_response = search_faq_tfidf(user_input, faq_data, faq_questions, faq_vectors)
        return faq_response


 # Streamlit web app
st.title("Customer Service Chatbot")

# Session state to store user login and chat history
if "page" not in st.session_state:
    st.session_state["page"] = "login"

if "faq_history" not in st.session_state:
    st.session_state["faq_history"] = []


# Page 1: Login Page
if st.session_state["page"] == "login":
    user_type = st.radio("Select and option", ["Old User", "New User", "Continue as Guest"])

    if user_type == "Old User":
        email = st.text_input("Enter your email address:")
        password = st.text_input("Enter your password:", type="password")
        if st.button("Login"):
            user = check_old_user(email, password)
            if user:
                st.session_state["logged_in"] = True
                st.session_state["user"] = user
                st.session_state["page"] = "main"
                st.success(f"Welcome back, {user['name']}!")
            else:
                st.error("Invalid credentials. Please try again.")

    elif user_type == "New User":
        name = st.text_input("Full Name")
        email = st.text_input("Email")
        mobile = st.text_input("Mobile")
        city = st.text_input("City")
        state = st.text_input("State")
        password = st.text_input("Create a password:", type = 'password')

        if st.button("Register"):
            if check_old_user(email, password):
                st.error("Email already exists! Please login as an old user.")
            else:
                add_new_customer(name, email, mobile, city, state, password)
                st.success("Registration sucessful! You can now log in.")
                st.session_state["page"] = "login"

    elif user_type == "Continue as Guest":
        st.session_state["guest"] = True
        st.session_state["page"] = "main"

# Page 2: Main page with options
if st.session_state["page"] == "main":
    option = st.radio("What would you like to do?", ["FAQs", "Product Queries", "Transaction Queries"])

    if option == "FAQs":
        user_input = st.text_input("Ask a question:")
        if st.button("Sumbit"):
            response = get_response(user_input)
            st.session_state["faq_history"].append({"question": user_input, "answer": response})

        for i, chat in enumerate(st.session_state["faq_history"]):
            st.write(f"**Q{i+1}:** {chat['question']}")
            st.write(f"**A{i+1}:** {chat['answer']}")

    elif option == "Product Queries":
        laptop_type = st.radio("Select Laptop Type", ["Gaming", "Normal", "Business"])
        filters = {}
        if st.checkbox("Filter by Processor"):
            filters["processor"] = st.selectbox("Select Processor", ["Ryzen 3", "Ryzen 5", "Ryzen 7", "Ryzen 9", "i3", "i5", "i7", "i9", "M1"])
        if st.checkbox("Filter by RAM"):
            filters["ram"] = st.selectbox("Select RAM", ["8GB", "16GB", "32GB"])
        if st.checkbox("Filter by Graphics"):
            filters["graphics"] = st.selectbox("Select Graphics", ["Integrated", "NVIDIA"])

        if st.button("Search"):
            products = get_product_data(laptop_type, filters)
            print(products)
            # Check if 'products' is a string (No results found message) or a list of products
            if isinstance(products, str):
                st.write(products)
            else:
                for product in products:
                    st.write(f"Product: {product['product_name']}, Price: {product['price']}, Processor: {product['processor']}, RAM: {product['ram']}, Graphics: {product['graphics']}")

    elif option == "Transaction Queries":
        if st.session_state.get("logged_in"):
            transactions = get_transaction_data(st.session_state["user"]["customerid"])
            if transactions:
                for transaction in transactions:
                    st.write(f"Transaction ID: {transaction['transactionid']}, Purchased Date: {transaction['purchase_date']}, Status: {transaction['delivery_status']}")
            else:
                st.write("No transactions found.")
        else:
            st.warning("Please Log in to view transactions.")