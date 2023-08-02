Charity Web Application

This is a portfolio web application that allows users to showcase their work and includes features such as a login-activated form, double validation, user registration with password verification, user panel for changing passwords and email addresses, administrative panel for managing foundations, categories, donations, and users, as well as the ability to send password reset emails and account confirmation emails.

Features
* Homepage: The main page of the application includes a login-activated form that enables users to submit their information. The form incorporates double validation to ensure the accuracy of the entered data.

* User Registration: Users can register an account with the application. Upon registration, a confirmation email is sent to the provided email address to verify the account.

* Password Reset: Users can request a password reset if they forget their password. An email is sent to the registered email address with instructions on how to reset the password securely.

* User Panel: The user panel provides users with the ability to change their passwords and email addresses. This feature allows for easy management of their accounts and the ability to update contact information as needed.

* Administrative Panel: The administrative panel offers functionalities such as editing and deleting foundations, categories, donations, and users. It serves as a powerful tool for managing the application's content and maintaining its relevance.

Technologies Used
* Spring Boot
* Hibernate
* JPA
* Lombok
* Spring Form
* Spring Security
* Spring Email
* Docker

Getting Started

To get started with this application, follow these steps:

1. Clone the repository: git clone https://github.com/your-username/portfolio-app.git
2. Navigate to the project directory: cd portfolioLabCharity
3. Install the dependencies: mvn install
4. Configure the application properties such as database connection settings and email configuration in the application.properties file.
5. Build and run the application: mvn spring-boot:run
6. Access the application in your browser at http://localhost:8080

Contributing

Contributions to this portfolio web application are welcome. If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

License

This project is licensed under the MIT License.

Acknowledgements

This application was developed using various open-source libraries and frameworks. Special thanks to the creators and contributors of Spring Boot, Hibernate, JPA, Lombok, Spring Form, Spring Security, and Spring Email for their valuable tools and resources.
