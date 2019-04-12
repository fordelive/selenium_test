def tc_05(browser)
  # -----------------------------------tc_05.1----------------------------------
  # User can not login with incorrect email.

  prepare_browser(browser)

  @driver.find_element(:xpath => "//a[contains(text(),'Login')]").click

  @driver.find_element(id: 'user_email').send_keys(INCORRECT_LOGIN)
  @driver.find_element(id: 'user_password').send_keys(USER_PASSWORD)

  sleep(CLICK_TIMEOUT)

  @driver.find_element(:xpath => "//input[@value='Log in']").click

  tc_name = "#{__method__}.1"

  if @driver.find_elements(xpath: "//a[contains(text(), 'Logout')]").size == 0 && @driver.find_elements(id: 'flash_alert').size > 0
    write_result(tc_name, browser,:passed)
  else
    write_result(tc_name, browser,:failed)
  end

  @driver.close

  # -----------------------------------tc_05.2----------------------------------
  # User cannot ligin with incorrect password

  prepare_browser(browser)

  @driver.find_element(:xpath => "//a[contains(text(),'Login')]").click

  @driver.find_element(id: 'user_email').send_keys(USER_LOGIN)
  @driver.find_element(id: 'user_password').send_keys(INCORRECT_PASSWORD)

  sleep(CLICK_TIMEOUT)

  @driver.find_element(:xpath => "//input[@value='Log in']").click

  tc_name = "#{__method__}.2"

  if @driver.find_elements(xpath: "//a[contains(text(), 'Logout')]").size == 0 && @driver.find_elements(id: 'flash_alert').size > 0
    write_result(tc_name, browser,:passed)
  else
    write_result(tc_name, browser,:failed)
  end

  @driver.close

  # -----------------------------------tc_05.3----------------------------------
  # User can not login with filled with incorrect data.

  prepare_browser(browser)

  @driver.find_element(:xpath => "//a[contains(text(),'Login')]").click

  @driver.find_element(id: 'user_email').send_keys(INCORRECT_LOGIN)
  @driver.find_element(id: 'user_password').send_keys(INCORRECT_PASSWORD)

  sleep(CLICK_TIMEOUT)

  @driver.find_element(:xpath => "//input[@value='Log in']").click

  tc_name = "#{__method__}.3"

  if @driver.find_elements(xpath: "//a[contains(text(), 'Logout')]").size == 0 && @driver.find_elements(id: 'flash_alert').size > 0
    write_result(tc_name, browser,:passed)
  else
    write_result(tc_name, browser,:failed)
  end

  @driver.close
end
