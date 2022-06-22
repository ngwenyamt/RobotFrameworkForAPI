*** Settings ***
Documentation                       User Management[Update Records]- Tebogo Ngwenya

Resource                            ../../../../ESG/Keywords/UserPortal/UserManagement/PUT_UserKeywords.robot



*** Test Cases ***
Update a user- Negative Scenario
    [Tags]                              UpdateUser-NegativeScenario
    Given update the user details where the user id and it's resource version are invalid
    When update the user details where the user id is valid and it's resource version is invalid
    And update the user details where first name contains 65 characters
    Then update the user details where last name contains 65 characters
    And update the user details where title is blank

Update a user- Positive Scenario
    [Tags]                              UpdateUser-PositiveScenario
    Given update the user details where the user id is valid and it's resource version is valid
    When update the user details where first name contains 64 characters
    And update the user details where last name contains 64 characters
