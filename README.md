# Json-logger Extension

## 2.2.0 version - Release notes

* Updated to support Java 17
* Upgraded dependencies to fix known vulnerabilities

## 2.1.0 version - Release notes

* Minimum supported mule runtime 4.3
* Upgraded dependencies to fix known vulnerabilities

## 2.0.1 version - Release notes

Bug fixes:
* Added support for large payloads

## 2.0.0 version - Release notes

New features:
* External Destinations
* Data masking

Improvements:
* Field ordering

More details in the coming blog post (stay tuned!)

## 1.1.0 version - Release notes

New features:
* Scoped loggers to capture "scope bound elapsed time". Great for performance tracking of specific components (e.g. outbound calls)
* Added "Parse content fields in json output" flag so that content fields can become part of final JSON output rather than a "stringified version" of the content

Improvements:
* Removed Guava and caching in general with a more efficient handling of timers (for elapsed time)
* Optimized generation of JSON output
* Code optimizations
* Minimized dependency footprint (down from ~23MB to ~13MB)
* Optimized parsing of TypedValue content fields

## Releasing
A merge into `main` releases the version of the POM: the pipeline makes the tag `vX.Y.Z`, publishes `X.Y.Z` to the org's Exchange and moves `main` to the next SNAPSHOT. For a minor or a major, change the version in the pull request (for example, to `1.2.0-SNAPSHOT`).

## Testing a SNAPSHOT in an API before the merge
Exchange takes the asset only under the org's ID, which git does not hold. Publish from a copy of the repository, with your settings.xml configured for Exchange, and commit nothing:

```
cp -R . /tmp/mulesoft-json-logger-plugin && cd /tmp/mulesoft-json-logger-plugin
sed -i.bak 's#<groupId>com.brunosouzas.mulesoft</groupId>#<groupId><YOUR_ORG_ID></groupId>#g' pom.xml
mvn clean org.mule.tools.maven:exchange-mule-maven-plugin:0.0.23:exchange-pre-deploy deploy org.mule.tools.maven:exchange-mule-maven-plugin:0.0.23:exchange-deploy
```

## Using the module in a Mule 4 project
A consumer references the asset by the org's ID. Add this dependency to the application's pom.xml:
```
<dependency>
	<groupId><YOUR_ORG_ID></groupId>
	<artifactId>json-logger</artifactId>
	<version>${version}</version>
	<classifier>mule-plugin</classifier>
</dependency>
```
