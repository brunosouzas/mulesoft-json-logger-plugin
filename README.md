# mulesoft-json-logger-plugin

> Structured JSON logging for Mule 4 — request, response, and exception events with configurable content.

Mule plugin for consistent JSON log output across API and integration flows. Foundation for operational traceability; pairs with `audit-logging-lib` for audit-grade event envelopes.

## Table of Contents

- [About](#about)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [CI/CD](#cicd)
- [Documentation](#documentation)
- [Related Projects](#related-projects)
- [License](#license)

## About

Platform-standard logging plugin published to Anypoint Exchange. Bundled via `maven-parent-pom` for all Mule applications.

## Features

- JSON-structured log entries (request / response / exception)
- Configurable `content` payload via DataWeave
- Compatible with Anypoint Monitoring search keys
- Exchange `mule-plugin` artifact

## Prerequisites

| Requirement | Version / notes |
|-------------|-----------------|
| Mule Runtime | 4.9.x |
| Maven | 3.9+ |
| Exchange org | `8d624bf1-5cd5-455e-94ea-6f2ba716a0ed` |

## Getting Started

```bash
mvn clean test package
```

| Field | Value |
|-------|-------|
| `artifactId` | `json-logger` |
| `version` | `1.1.0-SNAPSHOT` |
| `classifier` | `mule-plugin` |

## Usage

```xml
<dependency>
  <groupId>8d624bf1-5cd5-455e-94ea-6f2ba716a0ed</groupId>
  <artifactId>json-logger</artifactId>
  <version>1.1.0-SNAPSHOT</version>
  <classifier>mule-plugin</classifier>
</dependency>
```

Use `json-logger:logger` in flows. Set `content` with DataWeave; use INFO for operational trace, DEBUG for payloads.

## CI/CD

| Trigger | Branch | Action |
|---------|--------|--------|
| PR → `develop` | SNAPSHOT to Exchange |
| Merge `main` | Release + tag `v*` |

**Pipeline:** `publish-exchange.yml`

## Documentation

Detailed runbooks, architecture, and troubleshooting are maintained in the **Obsidian vault** (not in this repository).

| Topic | Obsidian path |
|-------|---------------|
| Repository card | `GitHub/repos/mulesoft-json-logger-plugin.md` |
| Documentation standard | `GitHub/readme-standard.md` |

## Related Projects

| Project | Relationship |
|---------|--------------|
| [audit-logging-lib](https://github.com/brunosouzas/audit-logging-lib) | Audit event builders for logger `content` |
| [mulesoft-error-handler-plugin](https://github.com/brunosouzas/mulesoft-error-handler-plugin) | Error responses + logging |
| [maven-parent-pom](https://github.com/brunosouzas/maven-parent-pom) | Default dependency |

## License

See [LICENSE](LICENSE).
