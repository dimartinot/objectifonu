# INSARAG Web APP : Objectif ONU

## Abstract

In any kind of strategic manoeuvres, communication is key. So how can it be possible to simplify the means of communication for deployed troops ? What key points do we have to deal with and how do we deal with them ? Thereby, the purpose of this project is to provide firefighters with an application that enhances their foreign detachment(s) with wider manoeuvring lines, thus facilitating mission coordination. This application should enable firemen to access information on the country of deployment quickly and efficiently. The application also needs to offer geolocation, with the identification of points of interest. Finally, the last point: the application must allow the transmission of information between the different members of the detachment, by text, audio or image, and this project responds to a number of constraints related to the organization of the detachment: the latter must include different levels of access according to the profiles, this being defined by the ranks occupied by the members of the detachment. In addition to all this, it is important to ensure that the application works as expected on mobile devices. Therefore, it is wise to say that providing any communication application is not the deal here, but providing the one they need, definitely is. Our implementation takes all that into account and forged it into one single application mixing functionality and intuitiveness. We do not forget what they need, but we also do not forget what they don’t.
### Prerequisites

This project is a **Spring** project using Spring Boot, Spring MVC and Spring Security. It is, therefore, coded in Java. You will need the [1.8 version](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) as declared in the pom.xml. As you may have noticed, we also compile using **Maven** so you will require it.
To verify your Maven installation, just type :
```
mvn -v
```
It should display the Maven version
### Installing

To install it, open your favourite J2EE and import the project as a Maven Project. Then, try running the project using these 3 commands :
```
maven clean install
maven dependency:tree
maven spring-boot:run
```
The project should be accessible using the following link : http://localhost:8080/. The port (8080) may differ depending on your Tomcat configuration.

## Deployment

To deploy this project, you have two solutions :
 - using a **jar** and the Tomcat server included in Spring Boot
 - using a **war**, excluding the Tomcat server, and deploying to any kind of web server accepting war archives (Liberty Server, Tomcat...).

## Built With

* [Spring](https://spring.io) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [Hibernate](http://hibernate.org) - ORM used to link the project with the database

## Authors

* **Hugo Antunes** - *Initial work* - [antuneshug](https://github.com/antuneshug)
* **Robin Chatelet** - *Initial work* - [RobOrion](https://github.com/RobOrion)
* **Thomas Di Martino** - *Initial work* - [dimartinot](https://github.com/dimartinot)
* **Thomas Ogier** - *Initial work* - [to0000g](https://github.com/to0000g)
* **Kenan Terrisse** - *Initial work* - [AnaMa98](https://github.com/AnaMa98)

We all are [EISTI](https://eisti.fr/) students and this project was done as a part of our 2nd year of engineering study.
