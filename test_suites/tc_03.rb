def tc_03(browser)
  # ------------------------case tc_03.1-----------------------------
  # User can login with remembering credentials

  prepare_browser(browser)

  @driver.find_element(xpath: "//a[contains(text(),'Login')]").click

  @driver.find_element(id: 'user_email').send_keys(USER_LOGIN)
  @driver.find_element(id: 'user_password').send_keys(USER_PASSWORD)
  @driver.find_element(xpath: "//label[@for='user_remember_me']").click
  sleep(CLICK_TIMEOUT)

  @driver.find_element(xpath: "//input[@value='Log in']").click
  sleep(CLICK_TIMEOUT)

  tc_name = "#{__method__}.1"

  if @driver.find_elements(xpath: "//a[contains(text(), 'Logout')]").size > 0
    write_result(tc_name, browser,:passed)
  else
    write_result(tc_name, browser,:failed)
  end

  # --------------------------case tc_03.2-------------------------------
  # User is signed in automatically when reopening the site

  session_cookies = @driver.manage.all_cookies
  @driver.close

  prepare_browser(browser)
  session_cookies.each {|cookie| @driver.manage.add_cookie(cookie)}

  @driver.navigate.refresh
  sleep(CLICK_TIMEOUT)

  tc_name = "#{__method__}.2"

  if @driver.find_elements(xpath: "//a[contains(text(), 'Logout')]").size > 0
    write_result(tc_name, browser,:passed)
  else
    write_result(tc_name, browser,:failed)
    @driver.close
    abort
  end

  # ---------------------------case tc_03.03------------------------------
  # User shouldn't be logged the site after logout

  @driver.find_element(xpath: "//a[contains(text(),'Logout')]").click
  session_cookies = @driver.manage.all_cookies

  sleep(CLICK_TIMEOUT)
  @driver.close

  prepare_browser(browser)
  session_cookies.each {|cookie| @driver.manage.add_cookie(cookie)}

  @driver.navigate.refresh

  tc_name = "#{__method__}.3"

  if @driver.find_elements(xpath: "//a[contains(text(), 'Logout')]").size == 0

    write_result(tc_name, browser, :passed)
  else
    write_result(tc_name, browser, :failed)
  end

  @driver.close
end