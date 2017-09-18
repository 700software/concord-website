---
layout: wmt/docs
title:  Configuration
side-navigation: wmt/docs-navigation.html
---

# Configuration

Most of the configuration done via environment variables (e.g. passed with a `docker run` command).

## Server

### Environment Variables

All parameters are optional.

**Database**

| Variable    | Description                                                     | Default value                        |
|-------------|-----------------------------------------------------------------|--------------------------------------|
| DB_DIALECT  | Type of the used database. Supported dialects: `H2`, `POSTGRES` | `H2`                                 |
| DB_DRIVER   | FQN of the driver's class.                                      | `org.h2.Driver`                      |
| DB_URL      | JDBC URL of the database.                                       | `jdbc:h2:mem:test;DB_CLOSE_DELAY=-1` |
| DB_USERNAME | Username to connect to the database.                            | `sa`                                 |
| DB_PASSWORD | Password to connect to the database.                            | _empty_                              |

**Log file store**

| Variable      | Description                                                 | Default value               |
|---------------|-------------------------------------------------------------|-----------------------------|
| LOG_STORE_DIR | Path to a directory where agent's log files will be stored. | _a new temporary directory_ |

**Secret store**

| Variable          | Description                                                                       | Default value |
|-------------------|-----------------------------------------------------------------------------------|---------------|
| SECRET_STORE_SALT | Store's salt value. If changed, all previously created keys will be inaccessable. |               |

**Dependencies**

| Variable           | Description                           | Default value                  |
|--------------------|---------------------------------------|--------------------------------|
| DEPS_STORE_DIR     | Directory with `system` dependencies. | `lib` directory of the server. |

**Security**

| Variable | Description                      | Default value          |
|----------|----------------------------------|------------------------|
| LDAP_CFG | Path to LDAP configuration file. | _empty_                |

**Repositories**

| Variable       | Description                                    | Default value               |
|----------------|------------------------------------------------|-----------------------------|
| REPO_CACHE_DIR | Directory to store project (git) repositories. | _a new temporary directory_ |

### LDAP

Create `ldap.properties` file, containing the following parameters
(substitute values with the values for your environment):

```
url=ldap://host:389
searchBase=DC=unit,DC=org,DC=com
principalSuffix=@unit.org.com
principalSearchFilter=(&(objectCategory=Person)(sAMAccountName={0}))
systemUsername=user
systemPassword=pwd
exposeAttributes=mail,company
```

Set `LDAP_CFG` environment variable to the path of the created file.

The `exposeAttributes` property defines a list of LDAP attributes that will be
[exposed to processes](./processes.html#provided-variables). Remove this property
to make all LDAP attributes available.

### Slack

Create `slack.properties` file, containing the following parameters
(substitute values with the values for your environment):

```
authToken=123456
proxyAddress=proxy.wal-mart.com
proxyPort=9080
connectTimeout=10000
soTimeout=10000
maxConnections=10
requestLimit=1
```

Set `SLACK_CFG` environment variable to the path of the created file.

| Variable       | Description                                                            |
|----------------| -----------------------------------------------------------------------|
| authToken      | Slack Bot API Token                                                    |
| proxyAddress   | Proxy host for slack.com/api access                                    |
| proxyPort      | Proxy port for slack.com/api access                                    |
| connectTimeout | The time in ms to establish the connection with the remote host        |
| soTimeout      | The time in ms waiting for data – after the connection was established |
| maxConnections | Maximum connections
| requestLimit   | Notifications per second

## Agent

### Environment Variables

All parameters are optional.

| Variable          | Description                                     | Default value               |
|-------------------|-------------------------------------------------|-----------------------------|
| SERVER_HOST       | Hostname of the server.                         | `localhost`                 |
| SERVER_PORT       | Port of the server's API for agents.            | `8101`                      |
| AGENT_LOG_DIR     | Directory to store payload execution log files. | _a new temporary directory_ |
| AGENT_PAYLOAD_DIR | Directory to store unpacked payload files.      | _a new temporary directory_ |
| AGENT_JAVA_CMD    | Path to `java` executable.                      | `java`                      |
| DEPS_CACHE_DIR    | Path to a directory for the dependency cache.   | _a new temporary directory_ |
