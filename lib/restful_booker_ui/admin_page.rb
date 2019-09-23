# frozen_string_literal: true

class AdminPage
  include Capybara::DSL

  def initialize(page)
    @page = page
  end

  def login(username, password)
    next_selector = '#next'
    @page.find(next_selector).click while page.has_css?(next_selector)

    close_selector = '#closeModal'
    @page.find(close_selector).click

    username_selector = '#username'
    password_selector = '#password'
    login_btn_selector = '#doLogin'

    @page.find(username_selector).set(username)
    @page.find(password_selector).set(password)
    @page.find(login_btn_selector).click
  end
end
