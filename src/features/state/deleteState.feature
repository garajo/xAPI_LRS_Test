Feature: Delete state

Scenario: Good delete state: [type] request cluster

    Given a [type] deleteState request cluster
    When the request is made on the primed LRS
    Then the deleteState response is verified

    Where:
        type
        typical
        withRegistration

Scenario: Good delete state: [type] request cluster with agent parameter set to an [value] agent

    Given a [type] deleteState request cluster
    Given all requests' agent parameter are set to an [value] agent
    When the request is made on the primed LRS
    Then the deleteState response is verified

    Where:
        type             | value
        typical          | mboxAndType
        typical          | mboxSha1AndType
        typical          | openidAndType
        typical          | accountAndType
        typical          | mboxOnly
        typical          | mboxSha1Only
        typical          | openidOnly
        typical          | accountOnly
        withRegistration | mboxAndType
        withRegistration | mboxSha1AndType
        withRegistration | openidAndType
        withRegistration | accountAndType
        withRegistration | mboxOnly
        withRegistration | mboxSha1Only
        withRegistration | openidOnly
        withRegistration | accountOnly

Scenario: Good delete state: [type] request cluster with stateId parameter set to 'test state id'

    Given a [type] deleteState request cluster
    Given all requests' stateId parameter are set to 'test state id'
    When the request is made on the primed LRS
    Then the deleteState response is verified

    Where:
        type
        typical
        withRegistration

Scenario: Bad delete state: [type] request missing [property]

    Given a [type] deleteState request
    Given the [property] is removed
    When the request is made
    Then the LRS responds with HTTP [HTTP]

    Where:
        HTTP | type             | property
        400  | typical          | version header
        401  | typical          | authority header
        400  | typical          | activityId parameter
        400  | typical          | agent parameter
        400  | withRegistration | version header
        401  | withRegistration | authority header
        400  | withRegistration | activityId parameter
        400  | withRegistration | agent parameter

Scenario: Bad delete state: [type] request with bad agent parameter an empty agent

    Given a [type] deleteState request
    Given the agent parameter is set to an empty agent
    When the request is made
    Then the LRS responds with HTTP 400

    Where:
        type
        typical
        withRegistration

Scenario: Bad delete state: [type] request with bad [property] '[value]'

    Given a [type] deleteState request
    Given the [property] is set to '[value]'
    When the request is made
    Then the LRS responds with HTTP [HTTP]

    Where:
        HTTP | type             | property               | value
        404  | typical          | resource               | activity/state
        404  | typical          | resource               | activities/states
        400  | typical          | version header         | bad version
        400  | typical          | version header         | 3.8.0
        400  | typical          | authority header       | Basic badAuth
        401  | typical          | authority header       | Basic TnsHNWplME1YZnc0VzdLTHRIWTo0aDdBb253Ml85WU53vSZLNlVZ
        400  | typical          | activityId parameter   | bad URI
        400  | withRegistration | activityId parameter   | bad URI
        400  | withRegistration | registration parameter | bad UUID

Scenario: Bad delete state: typical request with [modifier] agent parameter with bad [property] '[value]'

    Given a typical deleteState request
    Given the agent parameter is set to a [modifier] agent
    Given the params agent [property] is set to '[value]'
    When the request is made
    Then the LRS responds with HTTP 400

    Where:
        modifier       | property         | value
        mboxAndType    | mbox             | conformancetest@tincanapi.com
        mboxAndType    | mbox             | bad mbox
        mboxAndType    | objectType       | notAgent
        mboxAndType    | objectType       | Activity
        mboxOnly       | mbox             | conformancetest@tincanapi.com
        mboxOnly       | mbox             | bad mbox
        mboxAndType    | objectType       | agent
        openidAndType  | openid           | bad URI
        accountAndType | account homePage | bad URI
        openidOnly     | openid           | bad URI
        accountOnly    | account homePage | bad URI

Scenario: Bad delete state: typical request with [modifier] agent parameter missing [property]

    Given a typical deleteState request
    Given the agent parameter is set to a [modifier] agent
    Given the params agent [property] is removed
    When the request is made
    Then the LRS responds with HTTP 400

    Where:
        modifier       | property
        accountAndType | account homePage
        accountAndType | account name
        accountOnly    | account homePage
        accountOnly    | account name
        mboxAndType    | mbox
