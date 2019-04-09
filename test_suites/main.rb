require 'selenium-webdriver'

def prepare_browser(browser)
  driver = Selenium::WebDriver.for browser
  driver.navigate.to "http://google.com"

  element = driver.find_element(name: 'q')
  element.send_keys "Hello WebDriver!"
  element.submit

  puts driver.title

  driver.quit
end

prepare_browser(:firefox)