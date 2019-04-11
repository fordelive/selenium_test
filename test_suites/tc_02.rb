def tc_02(browser)
  prepare_browser(browser)

  @driver.find_element(xpath: "//a[contains(text(),'Login')]").click

  @driver.find_element(id: 'user_email').send_keys(USER_LOGIN)
  @driver.find_element(id: 'user_password').send_keys(USER_PASSWORD)

  @driver.find_element(xpath: "//input[@value='Log in']").click
  sleep(CLICK_TIMEOUT)

  if @driver.find_element(xpath: "//a[contains(text(), 'Logout')]").displayed?
    write_result(__method__, browser,:passed)
  else
    write_result(__method__, browser,:failed)
  end

  @driver.close
end

