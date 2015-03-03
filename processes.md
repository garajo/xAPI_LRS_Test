# Processes
This document outlines our internal processes for fixing issues and updating our version of the test suite.

## Getting Started
1. `npm install` (may need to run `sudo !!` after).
2. `cd src`.
3. Duplicate config.json.template as config.json.
4. Change config.json.
  1. Set `lrs.username`.
  2. Set `lrs.password`.
  3. Set `lrs.endpoint`.
  4. Set `lrs.version`.
5. [Run tests](run-tests).

## Fixing Issues
1. `git checkout master`.
2. `git checkout -b issue/N`.
3. Fix the issue.
4. `git checkout develop`.
5. `git merge issue/N`.
6. [Run tests](run-tests).

## Run Tests
1. `grunt clean`.
2. Go to your Mongo DB.
  1. `db.statements.remove({})` or `db.statements.remove({'lrs._id': 'LRS_ID'})`.
  2. `db.documentapi.remove({})` or `db.documentapi.remove({'lrs._id': 'LRS_ID'})`.
3. `grunt`.