[![Cyclos 3](../images/cyclos.png)](../cyclos-3)
##  Cyclos 3

The JPS package deploys Cyclos 3 that initially contains 1 application server and 1 database container.

### Highlights
This package is designed to deploy Cyclos environment is a feature-rich online banking solution that is easy to use and maintain, flexible, secure and highly customisable.<br />
Cyclos offers a complete on-line payment system with additional modules such as e-commerce and communication tools. The Cyclos platform permits institutions such as local banks and MFI`s to offer banking services that can stimulate local trade and development.
Cyclos is also used by many organizations and communities to provide community currency services.

### Environment Topology

![cyclos-3-environment-topology](..images/cyclos-3-environment-topology.png)

### Specifics

Layer                |     Server    | Number of CTs <br/> by default | Cloudlets per CT <br/> (reserved/dynamic) | Options
-------------------- | --------------| :----------------------------: | :---------------------------------------: | :-----:
AS                   | Tomcat Java |       1                        |           1 / 16                          | -
DB                   |    MySQL      |       1                        |           1 / 16                           | -

* AS - Application server 
* DB - Database 
* CT - Container

**Cyclos Version**: 3.7.3<br/>
**Tomcat Version**: 6.0.44<br/>
**Java Engine**: Java 6<br/>
**MySQL Database**: 5.7.12

### Deployment

In order to get this solution instantly deployed, click the "Get It Hosted Now" button, specify your email address within the widget, choose one of the [Jelastic Public Cloud providers](https://jelastic.cloud) and press Install.

[![GET IT HOSTED](https://raw.githubusercontent.com/jelastic-jps/jpswiki/master/images/getithosted.png)](https://jelastic.com/install-application/?manifest=https%3A%2F%2Fgithub.com%2Fjelastic-jps%2Fcyclos%2Fraw%2Fmaster%2Fcyclos-3%2Fmanifest.jps)

To deploy this package to Jelastic Private Cloud, import [this JPS manifest](../../../raw/master/cyclos-3/manifest.jps) within your dashboard ([detailed instruction](https://docs.jelastic.com/environment-export-import#import)).

More information about Jelastic JPS package and about installation widget for your website can be found in the [Jelastic JPS Application Package](https://github.com/jelastic-jps/jpswiki/wiki/Jelastic-JPS-Application-Package) reference.


