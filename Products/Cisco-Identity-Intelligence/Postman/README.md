# Cisco Identity Intelligence Public API

## Overview
The Cisco Identity Intelligence API is a GraphQL API. Our API uses machine-to-machine (M2M) authentication through the OAuth 2.0 client credentials flow.

## Authorization
We have chosen to use the JWT (JSON Web Token) as a type of access token, which allows you to sign a payload containing a JSON with a variable number of claims. Claims are a common way for applications to acquire user information, such as the permissions of the client that requested authentication. Client Credentials authentication method is based on sharing a client ID, a client secret, and an audience between the client and the Client Credentials service. This pair is created during client registration.
An access token is valid for 10 hours. The client must request a new token whenever it requires one.

## Set up
* Create an API Client integration in the Cisco Identity Intelligence console, and copy the integration properties aside
* Open the collection Variables tab
* Configure oortDomain to match the domain of the Cisco Identity Intelligence:
  * api.oort.io for the production environment in US
  * api.au.oort.io for the production environment in Australia
  * api.eu.oort.io for the production environment in Europe
  * api.staging.oort.io for the staging environment

* Configure the rest of the variables using the API Client integration properties you copied earlier under the Current Value column
* Leave oortAccessToken empty, this is filled by the script in the Pre-request Script tab
* Save the changes

