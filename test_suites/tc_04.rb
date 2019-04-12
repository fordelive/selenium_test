def tc_04(browser)
  # -----------------------------------tc_04.1----------------------------------
  # User can not login with blank password

  prepare_browser(browser)

  @driver.find_element(:xpath => "//a[contains(text(),'Login')]").click
  
  @driver.find_element(id: 'user_email').send_keys(USER_LOGIN)
  @driver.find_element(id: 'user_password').send_keys('')

  @driver.find_element(:xpath => "//input[@value='Log in']").click

  sleep(CLICK_TIMEOUT)

  tc_name = "#{__method__}.1"

  if @driver.find_elements(xpath: "//a[contains(text(), 'Logout')]").size == 0 && @driver.find_elements(id: 'flash_alert').size > 0
    write_result(tc_name, browser,:passed)
  else
    write_result(tc_name, browser,:failed)
  end

  @driver.close

  # -----------------------------------tc_04.2----------------------------------
  # User can not login with blank email

  prepare_browser(browser)

  @driver.find_element(:xpath => "//a[contains(text(),'Login')]").click

  @driver.find_element(id: 'user_email').send_keys('')
  @driver.find_element(id: 'user_password').send_keys(USER_PASSWORD)

  @driver.find_element(:xpath => "//input[@value='Log in']").click

  sleep(CLICK_TIMEOUT)

  tc_name = "#{__method__}.2"

  if @driver.find_elements(xpath: "//a[contains(text(), 'Logout')]").size == 0 && @driver.find_elements(id: 'flash_alert').size > 0
    write_result(tc_name, browser,:passed)
  else
    write_result(tc_name, browser,:failed)
  end

  @driver.close

  # -----------------------------------tc_04.3----------------------------------
  # User can not login with blank data

  prepare_browser(browser)

  @driver.find_element(:xpath => "//a[contains(text(),'Login')]").click

  @driver.find_element(id: 'user_email').send_keys('')
  @driver.find_element(id: 'user_password').send_keys(USER_PASSWORD)

  @driver.find_element(:xpath => "//input[@value='Log in']").click

  sleep(CLICK_TIMEOUT)

  tc_name = "#{__method__}.3"

  if @driver.find_elements(xpath: "//a[contains(text(), 'Logout')]").size == 0 && @driver.find_elements(id: 'flash_alert').size > 0
    write_result(tc_name, browser,:passed)
  else
    write_result(tc_name, browser,:failed)
  end

  @driver.close
end
