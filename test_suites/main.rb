require 'selenium-webdriver'
require 'dotenv/load'

Dir['tc_??.rb'].each {|file| require_relative file}


TEST_URL = 'https://demoapp.strongqa.com'
CLICK_TIMEOUT = 3
OUTPUT_FILE = 'results.txt'.freeze

USER_LOGIN = ENV.fetch('LOGIN')
USER_PASSWORD = ENV.fetch('PASSWORD')

INCORRECT_LOGIN = 'blabla@mail.net'
INCORRECT_PASSWORD = '123456'


def prepare_files
  File.delete(OUTPUT_FILE) if File.exists?(OUTPUT_FILE)
end

def prepare_browser(browser)
  @driver = Selenium::WebDriver.for browser
  @driver.manage.timeouts.implicit_wait = 10 # seconds
  @driver.manage.window.maximize

  @driver.navigate.to TEST_URL
  sleep(CLICK_TIMEOUT)
end

def write_result(tc_name, browser, result)
# variants of reporting strings:
# tc_01 (firefox): passed
# tc_01 (chrome): failed

  File.open(OUTPUT_FILE, 'a') {|f| f.puts"#{tc_name} (#{browser}): #{result}"}
end


BROWSER_LIST = [:chrome]

prepare_files

BROWSER_LIST.each do |browser|
  # tc_01(browser)
  # tc_02(browser)
  tc_03(browser)
#   tc_04(browser)
#   tc_05(browser)
end