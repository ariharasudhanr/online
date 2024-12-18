# Spring Boot Shopping Cart Web App

## About

This is a demo project for practicing Spring + Thymeleaf. The idea was to build some basic shopping cart web app.

It was made using **Spring Boot**, **Spring Security**, **Thymeleaf**, **Spring Data JPA**, **Spring Data REST and Docker**. 
Database is in memory **H2**.

There is a login and registration functionality included.

Users can shop for products. Each user has his own shopping cart (session functionality).
Checkout is transactional.

<br /> <img align="center" width="900" height="500" src="https://github.com/user-attachments/assets/85a0714e-b650-48a9-b6a7-c8853b8dac99"> <br />

## Configuration

### Configuration Files

Folder **src/resources/** contains config files for **shopping-cart** Spring Boot application.

* **src/resources/application.properties** - main configuration file. Here it is possible to change admin username/password,
as well as change the port number.

☁️ AWS: Cloud platform for computing, storage, and networking.

<br /> <img align="center" width="900" height="500" src="https://github.com/user-attachments/assets/9455178d-3511-4005-b01a-84398398bbaa"> <br />
<br /> <img align="center" width="900" height="500" src="https://github.com/user-attachments/assets/05d7ba36-8b17-46e3-947d-997a921ae157"> <br />

## How to run

There are several ways to run the application. You can run it from the command line with included Maven Wrapper, Maven or Docker. 

Once the app starts, go to the web browser and visit `http://localhost:8070/home`

Admin username: **admin**

Admin password: **admin**

User username: **user**

User password: **password**

<br /> <img align="center" width="900" height="500" src="https://github.com/user-attachments/assets/b80db928-5417-4047-863b-2e7643a904bc"> <br />


### Maven Wrapper

#### Using the Maven Plugin

Go to the root folder of the application and type:
```bash
$ chmod +x scripts/mvnw
$ scripts/mvnw spring-boot:run
```

#### Using Executable Jar

Or you can build the JAR file with 
```bash
$ scripts/mvnw clean package
``` 

Then you can run the JAR file:
```bash
$ java -jar target/shopping-cart-0.0.1-SNAPSHOT.jar
```

### Maven

Open a terminal and run the following commands to ensure that you have valid versions of Java and Maven installed:

```bash
$ java -version
java version "1.8.0_102"
Java(TM) SE Runtime Environment (build 1.8.0_102-b14)
Java HotSpot(TM) 64-Bit Server VM (build 25.102-b14, mixed mode)
```

```bash
$ mvn -v
Apache Maven 3.3.9 (bb52d8502b132ec0a5a3f4c09453c07478323dc5; 2015-11-10T16:41:47+00:00)
Maven home: /usr/local/Cellar/maven/3.3.9/libexec
Java version: 1.8.0_102, vendor: Oracle Corporation
```

#### Using the Maven Plugin

The Spring Boot Maven plugin includes a run goal that can be used to quickly compile and run your application. 
Applications run in an exploded form, as they do in your IDE. 
The following example shows a typical Maven command to run a Spring Boot application:
 
```bash
$ mvn spring-boot:run
``` 

#### Using Executable Jar

To create an executable jar run:

```bash
$ mvn clean package
``` 

To run that application, use the java -jar command, as follows:

```bash
$ java -jar target/shopping-cart-0.0.1-SNAPSHOT.jar
```

To exit the application, press **ctrl-c**.

🔍 SonarQube: Code quality inspection and vulnerability detection.
<br /> <img align="center" width="900" height="500" src="https://github.com/user-attachments/assets/a83f831c-0769-4492-bd75-3f913d522cb8"> <br />
### Docker

It is possible to run **shopping-cart** using Docker:

Build Docker image:
```bash
$ mvn clean package
$ docker build -t shopping-cart:dev -f docker/Dockerfile .
```

Run Docker container:
```bash
$ docker run --rm -i -p 8070:8070 \
      --name shopping-cart \
      shopping-cart:dev
```

##### Helper script

It is possible to run all of the above with helper script:

```bash
$ chmod +x scripts/run_docker.sh
$ scripts/run_docker.sh
```
🐳 Docker Push: Pushes images to the repository.

<br /> <img align="center" width="900" height="500" src="https://github.com/user-attachments/assets/96366035-310f-42d9-9e9e-286f9007e4df"> <br />
## Docker 

Folder **docker** contains:

* **docker/shopping-cart/Dockerfile** - Docker build file for executing shopping-cart Docker image. 
Instructions to build artifacts, copy build artifacts to docker image and then run app on proper port with proper configuration file.

## Util Scripts

* **scripts/run_docker.sh.sh** - util script for running shopping-cart Docker container using **docker/Dockerfile**

## Tests

Tests can be run by executing following command from the root of the project:

```bash
$ mvn test
```
🚀 Deploy to Server: Deploys the application.
<br /> <img align="center" width="900" height="500" src="https://github.com/user-attachments/assets/fb779f19-a800-40c3-931a-3c5dd85bcb68"> <br />
<br /> <img align="center" width="900" height="500" src="https://github.com/user-attachments/assets/eefdd513-a87d-4641-a68f-8d222b1a03dc"> <br />
## Helper Tools

### HAL REST Browser

Go to the web browser and visit `http://localhost:8070/`

You will need to be authenticated to be able to see this page.

### H2 Database web interface

Go to the web browser and visit `http://localhost:8070/h2-console`

In field **JDBC URL** put 
```
jdbc:h2:mem:shopping_cart_db
```

In `/src/main/resources/application.properties` file it is possible to change both
web interface url path, as well as the datasource URL.


<br /> <img align="center" width="900" height="500" src="https://github.com/user-attachments/assets/14f97111-aefa-45c9-8892-33ac829e920d"> <br />
<br /> <img align="center" width="900" height="500" src="https://github.com/user-attachments/assets/6ef50221-5ac6-4abf-9482-ac7617c3a3cd"> <br />

