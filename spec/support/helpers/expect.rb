
def expect_flash_notice(text)
  expect(page).to have_selector '.alert-success', text: text
  end

def expect_flash_alert(text)
  expect(page).to have_selector '.alert-warning', text: text
end

def expect_flash_info(text)
  expect(page).to have_selector '.alert-info', text: text
end

def expect_flash_info_blank
  expect(page).not_to have_selector '.alert-info'
end

def expect_flash_alert_blank
  expect(page).not_to have_selector '.alert-warning'
end

def expect_error_message(text)
  expect(page).to have_selector 'form h2.errors', text: text
end

def expect_to_see(text)
  expect(page.text).to include text
end

def expect_not_to_see(text)
  expect(page.text).not_to include text
end

def expect_to_have_a_layout
  expect_to_see('dummy')
end

def expect_not_to_have_a_layout
  expect_not_to_see('dummy')
end

def expect_to_be_on(path)
  expect(current_path).to eq path
end

def expect_flash_notice_signed_in
  expect_flash_notice 'You have signed in successfully'
end

def expect_flash_auth(situation)
  case situation
  when nil                          then expect_flash_alert_blank
  when :must_be_authenticated       then expect_flash_alert 'You must sign in to continue.'
  when :cannot_be_a_authenticated   then expect_flash_alert 'You have already signed in.'
  when :must_be_an_onboarding            then expect_flash_alert 'You have already completed your registration.'
  when :cannot_be_an_onboarding          then expect_flash_alert 'Please complete your registration.'
  when :must_be_a_master then expect_flash_alert 'This section of website is restricted to admins.'
  else fail("unknown auth_situation '#{situation}'")

  end
end
