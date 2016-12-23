from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver import Remote # Remote imported only for cod completion
import logging

def get_current_browser():
    browser = BuiltIn().get_library_instance('Selenium2Library').current_browser()
    return browser

def get_title_via_python():
    driver = get_current_browser()
    title = driver.title
    driver.find_element_by_class_name()
    logging.warn("checking title %s" % title)
    return title