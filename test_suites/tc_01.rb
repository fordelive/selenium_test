def tc_01(browser) # User can open login page via menu

  prepare_browser(browser)

  @driver.find_element(xpath: "//a[contains(text(),'Login')]").click

  # sleep(CLICK_TIMEOUT)

  if @driver.find_element(xpath: "//h3[contains(text(),'Login form')]").displayed?
    write_result(__method__, browser,:passed)
  else
    write_result(__method__, browser,:failed)
  end

  @driver.close
end
