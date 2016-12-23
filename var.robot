
*** Settings ***
Documentation   This suite contains simple test for hireukraine
Library  Selenium2Library
Library  BuiltIn
Library  MyLibrary.py

*** Variables ***

${BROWSER}  firefox
${DELAY}    1
# Pages URL
${mainPageURL}                  http://hireukraine.me
${webDevPageURL}                http://hireukraine.me/web-development/
${webDesignPageURL}             http://hireukraine.me/web-design/
${EcommercePageURL}             http://hireukraine.me/e-commerce/
${DesignMobilePageURL}          http://hireukraine.me/design-mobile-app/
${UserIntergacesPageURL}        http://hireukraine.me/user-interfaces/
${QualityAssurancePageURL}      http://hireukraine.me/quality-assurance/
${ContactUsPageURL}             http://hireukraine.me/contact-us/


# Header
${contactUsLink}                xpath=//*[@id='menu-item-35']/a
${OurServicesDropDownLink}      xpath=//*[@id='menu-item-36']/a
## Our Services DropDown List
${webDevPageDropDownLink}       xpath=//*[@id='menu-item-34']/a
${webDesignDropDownLink}        xpath=//*[@id='menu-item-33']/a
${ecomerceDropDownLink}         xpath=//*[@id='menu-item-32']/a
${designMobileDropDownLink}     xpath=//*[@id='menu-item-31']/a
${userInterfacesDropDownLink}   xpath=//*[@id='menu-item-30']/a
${qualityAssureDropDownLink}    xpath=//*[@id='menu-item-29']/a

# Main Page
${hireUsButton}                 xpath=//*[@class="popup_c btn-white"]
${hireUsPopUpForm}              xpath=//*[@class="popup-form"]
${closehireUsPopUpButton}       xpath=//*[@type="button"]
${LetsStartButton}              xpath=//*[@class="dark-blue blue-bottom"]//a

# Contact Us Page
${NameField}                    xpath=//*[@class= "web-content"]//div[4]//span[1]/input
${EmailField}                   xpath=//*[@class= "web-content"]//div[4]//span[2]/input
${MessageField}                 xpath=//*[@class= "web-content"]//div[4]//span[3]/textarea
${SendButton}                   xpath=//*[@class= "web-content"]//div[4]//p[2]/input
${ErrorMessages}                xpath=//*[@role="alert"]


*** Keywords ***

Open Main Page
    Open Browser    ${mainPageURL}  ${BROWSER}
    maximize browser window
    wait until page contains  Who We Are


Scroll Page to Locator
    [Arguments]  ${x_location}  ${y_location}
    execute javascript      window.scrollTo(${x_location},${y_location})

Open Our Services dropdown list
    wait until element is enabled   ${OurServicesDropDownLink}
    mouse over  ${OurServicesDropDownLink}
    wait until element is enabled  ${webDevPageDropDownLink}

Our Services -> Web Development
    wait until element is enabled   ${OurServicesDropDownLink}
    mouse over  ${OurServicesDropDownLink}
    wait until element is enabled  ${webDevPageDropDownLink}
    click link  ${webDevPageDropDownLink}
    wait until page contains  Web Development

Our Services -> Web Design
    wait until element is enabled   ${OurServicesDropDownLink}
    mouse over  ${OurServicesDropDownLink}
    wait until element is visible   ${webDesignDropDownLink}
    click link  ${webDesignDropDownLink}
    wait until page contains  Web Design

Our Services -> E-commerce
    wait until element is enabled   ${OurServicesDropDownLink}
    mouse over  ${OurServicesDropDownLink}
    wait until element is visible     ${ecomercedropdownlink}
    click link  ${ecomercedropdownlink}
    wait until page contains  E-commerce

Our Services -> Design mobile App
    wait until element is enabled   ${OurServicesDropDownLink}
    mouse over  ${OurServicesDropDownLink}
    wait until element is visible     ${designMobileDropDownLink}
    click link  ${designMobileDropDownLink}
    wait until page contains  Design mobile App

Our Services -> User Interfaces
    wait until element is enabled   ${OurServicesDropDownLink}
    mouse over  ${OurServicesDropDownLink}
    wait until element is visible     ${userInterfacesDropDownLink}
    click link  ${userInterfacesDropDownLink}
    wait until page contains  User Interfaces

Our Services -> Quality Assurance
    wait until element is enabled   ${OurServicesDropDownLink}
    mouse over  ${OurServicesDropDownLink}
    wait until element is visible     ${qualityAssureDropDownLink}
    click link  ${qualityAssureDropDownLink}
    wait until page contains    Quality Assurance

Go to 'Contact Us' Page
    wait until element is visible  ${contactUsLink}
    click link  ${contactUsLink}
    wait until page contains    Contact Us

Go to all Pages from 'Our-Services' drop down list
    Our Services -> Web Development
    Our Services -> Web Design
    Our Services -> E-commerce
    Our Services -> Design mobile App
    Our Services -> User Interfaces
    Our Services -> Quality Assurance

Open and close HireUs Pop-up window
    wait until element is visible  ${hireUsButton}
    click link  ${hireusbutton}
    wait until element is visible  ${hireUsPopUpForm}
    click button  ${closehireUsPopUpButton}

Open and close Lets-Start Pop-up window
    wait until element is visible  ${LetsStartButton}
    click link  ${LetsStartButton}
    wait until element is visible  ${hireUsPopUpForm}
    click button  ${closehireUsPopUpButton}


### Contact Us Page

Open Contact Us Page
    Open Browser    ${contactuspageurl}  ${BROWSER}
    maximize browser window
    wait until page contains    Contact Us

Enter data only on Name Field
    input text  ${namefield}   TestName
    click image  ${sendbutton}
    wait until element is visible  ${errormessages}

Enter invalid data on email field
    input text  ${emailfield}  test@test
    click image  ${sendbutton}
    wait until page contains  The e-mail address entered is invalid.

Enter data on message field
    input text  ${messagefield}      123
    click link  ${contactuslink}

Enter valid data only on email field
    input text  ${emailfield}   test@test.com
    click image  ${sendbutton}
    wait until element is visible  ${errormessages}
