# Chatbot for Computer Hardware Store

## Overview
This project is focused on building a chatbot for a computer hardware shop using **Streamlit** and **Natural Language Processing (NLP)** techniques. The chatbot provides assistance to users by answering FAQs, helping them browse products, and providing transaction-related information. The chatbot leverages **Spacy**, **TF-IDF Vectorizer**, and **Cosine Similarity** to match user queries with relevant FAQ answers and handle product queries efficiently by filtering based on specifications. Additionally, it offers a registration and login feature for old and new customers and can track transaction queries for logged-in users.

### Features:
1. **User Login/Registration**: 
   - Old users can log in with their email and password.
   - New users can register by providing details (name, email, mobile, city, state, and password).
   - Option for guests to continue without registering.

2. **FAQ Matching**:
   - Uses **TF-IDF** and **Cosine Similarity** to find the best answer to user queries.
   - A threshold is applied to ensure that only queries with sufficient similarity get responses, otherwise, the user is asked to rephrase the question.

3. **Product Queries**:
   - Users can select different types of laptops (Gaming, Normal, Business).
   - Filter products based on processor, RAM, and graphics card.
   - Query results are fetched directly from a MySQL database.

4. **Transaction Queries**:
   - Old users can check their past transactions.
   - Retrieves order status and details from the MySQL database.

5. **Conversation History**:
   - The FAQ section maintains a conversation-like history of questions and answers to provide a natural flow during interactions.

6. **Advanced Intent Detection**:
   - Detects greetings and goodbyes to provide appropriate responses.
   
7. **Future Learning Mechanism** (Planned):
   - If the chatbot is unable to answer a query, the query will be forwarded to a customer service representative. The chatbot will later learn from the representative's response and incorporate it into its knowledge base, enabling real-time learning and improvements.

---

## Code Structure

### `bot.py`
This script contains the main logic of the chatbot's functionalities. Key components include:
- **NLP Processing**: Uses **Spacy** for lemmatization and removal of stopwords, punctuation, and irrelevant entities.
- **FAQ Handling**: Loads an FAQ document from a `.docx` file and applies **TF-IDF** and **Cosine Similarity** for query matching.
- **Streamlit Pages**: Implements a user interface for login, product queries, and transaction queries.
- **Session State Management**: Keeps track of the logged-in user, chat history, and other session-related variables.

### `sql_connection.py`
This script manages the connection to a **MySQL** database and includes functions to:
- Check for old users and verify login credentials.
- Add new users to the customer database with hashed passwords.
- Fetch product details based on selected filters (category, processor, RAM, and graphics).
- Retrieve transaction details for logged-in users.

---

## Challenges Faced

1. **Accurate Response Matching**:
   One of the main challenges was ensuring the chatbot could accurately match user queries to FAQ answers using NLP algorithms. While **TF-IDF** and **Cosine Similarity** provided a strong foundation, fine-tuning the threshold for matching was crucial. Setting it too high would cause many queries to go unanswered, while setting it too low would result in irrelevant answers. Achieving the right balance took time to enhance accuracy.

2. **Dynamic Product Filtering**:
   Implementing dynamic product filtering based on multiple criteria (e.g., processor, RAM, graphics) required designing flexible query logic in SQL that could accommodate combinations of filters. Handling cases with no results while ensuring efficient queries was essential for performance.

3. **Session Management**:
   Managing session states in **Streamlit** for login persistence and conversation history required careful handling of session variables. Ensuring a smooth user experience across different pages while maintaining the session was another challenge.

---

## Future Goals

1. **Integration with Standard AI Solutions**:
   - We plan to integrate the chatbot with existing **AI services** like **OpenAI**, **Dialogflow**, or **IBM Watson** to enhance the chatbot’s ability to understand and respond to queries. This will provide more sophisticated conversation flows and better handling of ambiguous or complex questions.

2. **Real-Time Learning**:
   - One of the most important future goals is enabling **real-time learning**. If a new query is asked that the chatbot cannot answer, and it is forwarded to a human representative, the representative’s answer will be automatically added to the chatbot's database. The chatbot will learn from this response, ensuring that similar queries in the future are handled autonomously.
   
3. **Enhanced Customer Feedback Mechanism**:
   - Implementing a feedback mechanism that allows customers to rate responses or provide comments on their experience. This feedback will help improve the bot’s accuracy over time by flagging responses that need refinement.

4. **Multi-language Support**:
   - Expanding the chatbot to handle queries in multiple languages, thereby broadening its usability for non-English speakers. Integration with translation APIs and multilingual NLP models would be needed for this.

5. **Mobile and Voice Interaction**:
   - Enhancing the bot’s interface to work on mobile platforms and adding support for **voice queries**. This will make the chatbot accessible across different devices and for users who prefer speaking to typing.

6. **Continuous Performance Monitoring**:
   - Setting up performance tracking metrics to monitor query resolution times, accuracy of responses, and overall customer satisfaction, helping maintain a high standard of service.

---

## Technologies Used

- **Python**
- **Streamlit** for web interface
- **Spacy** for NLP processing
- **TF-IDF Vectorizer** and **Cosine Similarity** for text matching
- **MySQL** for data storage
- **Hashlib** for password encryption
- **Docx** for FAQ document handling

---
