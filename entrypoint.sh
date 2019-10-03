#!/bin/bash
yarn install --frozen-lockfile
exec "$@"
