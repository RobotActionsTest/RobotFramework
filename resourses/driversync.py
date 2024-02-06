from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from robot.api.deco import keyword


@keyword
def get_chromedriver_path():
    driver_path = ChromeDriverManager().install()
    print(driver_path)
    return driver_path


@keyword
def get_geckodriver_path():
    driver_path = GeckoDriverManager().install()
    print(driver_path)
    return driver_path
