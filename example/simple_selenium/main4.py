from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options

service = Service('/usr/bin/chromedriver')
service.start()

# 创建Chrome浏览器实例
options = Options()
options.add_argument('--headless')
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')
options.add_argument('--disable-extensions')
options.add_argument('--disable-gpu')

# 创建Chrome浏览器实例
driver = webdriver.Chrome(options=options,service=service)

# 打开Google网站
driver.get('https://www.google.com')

# 在Google搜索框中输入关键字并搜索
search_box = driver.find_element_by_name('q')
search_box.send_keys('Selenium Python')
search_box.submit()

# 输出搜索结果页面标题
print(driver.title)

# 关闭浏览器实例
driver.quit()