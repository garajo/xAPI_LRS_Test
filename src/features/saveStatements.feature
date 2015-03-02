Feature: saveStatements

Scenario: Good save statements: [type] request

    Given a [type] saveStatements request
    When the request is made
    Then the LRS responds with HTTP [HTTP]

    Where:
        HTTP | type
        200  | typical

Scenario: Bad save statements: [type] request with bad [property] '[value]'

    Given a [type] saveStatements request
    Given the [property] is set to '[value]'
    When the request is made
    Then the LRS responds with HTTP [HTTP]

    Where:
        HTTP | type    | property              | value
        400  | typical | method                | PUT
        400  | typical | resource              | statement
        400  | typical | authority header      | bad auth
        400  | typical | version header        | 0.8.0
        400  | typical | version header        | bad version
        400  | typical | Content-Type header   | bad content type

Scenario: Bad save statements: [type] request missing [property]

    Given a [type] saveStatements request
    Given the [property] is deleted
    When the request is made
    Then the LRS responds with HTTP [HTTP]

    Where:
        HTTP | type    | property
        400  | typical | version header
        401  | typical | authority header
        400  | typical | Content-Type header
