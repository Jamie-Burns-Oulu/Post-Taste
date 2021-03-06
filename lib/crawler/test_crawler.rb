require 'selenium-webdriver'

class WebCrawlerTest
    def initialize()
        puts 'Initializing WebCrawlerTest...'
        @list_of_restaurants = []
        @driver = {}
        setup_webdriver()
        get_data()
    end

    def get_data()
        puts "Opening website.."
        @driver.get('https://www.drudgereport.com')
        puts "Website opened"
        puts "Finding element.."
        first_element = @driver.find_element(css: 'body > font > font > center > table > tbody > tr > td:nth-child(1) > tt > b > a:nth-child(1)').text.strip
        puts "FIRST ELEMENT: #{first_element}"
        close_connection()
    end
    
    private

    def setup_webdriver()
        puts 'Setting up webdriver'
        options = Selenium::WebDriver::Chrome::Options.new
        puts "chromedriver ENV: #{ENV.fetch('GOOGLE_CHROME_SHIM', nil)}"
        chrome_bin_path = ENV.fetch('GOOGLE_CHROME_SHIM', nil)
        options.binary = chrome_bin_path if chrome_bin_path # only use custom path on heroku
        options.add_argument('--headless') # this may be optional
        # options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
        @driver = Selenium::WebDriver.for :chrome, options: options
        # driver = Selenium::WebDriver.for(:chrome, options: options)
        puts "Webdriver: #{@driver}"
    end

    def close_connection()
        @driver.quit
    end
end