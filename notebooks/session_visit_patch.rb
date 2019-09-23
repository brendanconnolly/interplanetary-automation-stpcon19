# frozen_string_literal: true

module Capybara
  class Session
    # alias_method :old_visit, :visit

    def visit(url)
      begin
        handles = driver.window_handles
        handle_count = handles.count
        # driver.visit(url)
      rescue StandardError => e
        handle_count = 0
      end

      if handle_count == 0
        begin
          puts 'no handles -->respawning driver'
          driver.quit
        rescue StandardError => e
          return e.class
        end
      end

      driver.visit(url)
    end
  end
  end
