---
layout: wmt/docs
title:  Configuration
---

# Development

## Running from an IDE

You can start the server and the agent directly from an IDE using the following main
classes:
- concord-server: `com.walmartlabs.concord.server.Main`
- concord-agent: `com.walmartlabs.concord.agent.Main`

To use predefined project templates, the server must be started with `DEPS_STORE_DIR`
environment variable pointing to the `server/impl/target/deps` directory.

To use LDAP authentication set `LDAP_CFG` environment variable pointing to a [LDAP
configuration file](./configuration.html#ldap).

To start the UI, please refer to the console's readme file.

## Debugging

The `concord-server` and `concord-agent` processes are plain Java processes and can be
started in debug mode as usual.

However, as the agent processes its payload in a separate JVM, it must be configured to
start those processes with the remove debugging enabled: *TBD*

## Building

To skip NPM-related tasks when building the project:
```
./mvnw clean install -DskipTests -DskipNpmInstall -DskipNpmBuild
```

## Making a release

All JAR files are signed using a GPG key. Pass phase for a key must be configured in
`~/.m2/settings.xml`:
```xml
<profiles>
  <profile>
    <id>development</id>
    <properties>
      <gpg.passphrase>MY_PASS_PHASE</gpg.passphrase>
    </properties>
  </profile>
</profiles>
```

1. use `maven-release-plugin` as usual:
   ```
   ./mvnw release:prepare release:perform
   ```
2. push docker images:
   ```
   git checkout NEW_TAG
   export DOCKER_REGISTRY=docker.prod.walmart.com
   ```
3. don't forget to push new tags and the release commit:
   ```
   git push origin master --tags
   ```

## Pull requests

- squash and rebase your commits;
- wait for CI checks to pass.