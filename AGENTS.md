# mulesoft-json-logger-plugin: project context

JSON Logger - Mule 4 (`json-logger`), a Mule 4 extension published to the org's Exchange. Read [README.md](README.md) first.

Stack: Java, Mule SDK, Maven
Delivery: B
Integration branch: main
Standards: azure-devops=personal, mulesoft-delivery=personal
Article: none

## Source of truth

- Delivery: the vault note `10-personal/processos/entrega-mulesoft-proposta-2026-11-21.md` (section "Bibliotecas") and `templates/stages/mulesoft-library.yml` of `azure-devops-mulesoft-reusable-templates`, at the ref `azure-pipelines.yml` pins.

## Changes

- Every change is a pull request into `main`, squash-merged. Its merge is a release, so Bruno approves every pull request (`.github/CODEOWNERS`).
- The Maven release moves the patch; a minor or a major changes the version in the pull request itself.
- Git holds the groupId `com.brunosouzas.mulesoft`; never put an org ID in this repository.

## Checks

The pull request's run of `mulesoft-json-logger-plugin`: build and tests (`mvn clean verify`, Maven 3.9).

## Deliver and verify

The merge runs `release:prepare` as the release App (tag `vX.Y.Z`, `main` at the next SNAPSHOT), then publishes `X.Y.Z` to the org's Exchange under the org's ID. Verify: the tag, its row in `releases.csv` of `brunosouzas/delivery-register`, and its GitHub Release.
