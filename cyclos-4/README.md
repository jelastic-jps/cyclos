[![Cyclos 4](../images/cyclos.png)](../cyclos-4)
##  Cyclos 4

The JPS package deploys Cyclos 4 that initially contains 1 application server and 1 database container.

### Highlights
This package is designed to deploy Cyclos environment is a feature-rich online banking solution that is easy to use and maintain, flexible, secure and highly customisable.<br />
Cyclos comes with a range of banking and payment options, a complete e-commerce system and high and low end mobile access channels. The mobile channel offers a scalable and cheap opportunity for banks to enlarge their offer branchless banking.
Cyclos is used by local banks, C3 networks, MFI's, barters, community currencies and time banks. The dynamic structure of Cyclos allows organisations to ‘build’ a dedicated payment system from scratch just by changing the configuration (without the hassle to make code changes).

### Environment Topology

![Cyclos 4 Topology](https://docs.google.com/drawings/d/1y_9OrXUGu3IssIkZ7oYwEkOj2D75K1lRNjri4NYpVEA/pub?w=505&h=216)

### Specifics

Layer                |     Server    | Number of CTs <br/> by default | Cloudlets per CT <br/> (reserved/dynamic) | Options
-------------------- | --------------| :----------------------------: | :---------------------------------------: | :-----:
AS                   | Tomcat Java |       1                        |           1 / 16                          | -
DB                   |    PostgreSQL      |       1                        |           1 / 16                           | -

* AS - Application server 
* DB - Database 
* CT - Container

**Cyclos Version**: 4.5<br/>
**Tomcat Version**: 7.0.67<br/>
**Java Engine**: Java 7<br/>
**PostgreSQL Database**: 9.5.2

### Deployment

In order to get this solution instantly deployed, click the "Get It Hosted Now" button, specify your email address within the widget, choose one of the [Jelastic Public Cloud providers](https://jelastic.cloud) and press Install.

[![GET IT HOSTED](https://raw.githubusercontent.com/jelastic-jps/jpswiki/master/images/getithosted.png)](https://jelastic.com/install-application/?manifest=https%3A%2F%2Fgithub.com%2Fjelastic-jps%2Fcyclos%2Fraw%2Fmaster%2Fcyclos-4%2Fmanifest.jps)

To deploy this package to Jelastic Private Cloud, import [this JPS manifest](../../../raw/master/manifest.jps) within your dashboard ([detailed instruction](https://docs.jelastic.com/environment-export-import#import)).

More information about Jelastic JPS package and about installation widget for your website can be found in the [Jelastic JPS Application Package](https://github.com/jelastic-jps/jpswiki/wiki/Jelastic-JPS-Application-Package) reference.