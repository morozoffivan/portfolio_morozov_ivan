import time

from selenium import webdriver

from selenium.webdriver.common.by import By

driver = webdriver.Chrome()
time.sleep(5)

driver.get('https://chlist.sitechco.ru/')
time.sleep(5)

# Проверка работы кнопки смены языка
change_lang_btn = driver.find_element(By.CLASS_NAME,'switchLang')
change_lang_btn.click()
time.sleep(5)

# Проверка входа в систему существуещего пользователя
email = driver.find_element(By.NAME, 'user_auth[email]')
password = driver.find_element(By.NAME,'user_auth[password]')
email.send_keys('ivan.morozov.forskypro@yandex.ru')
time.sleep(5)
password.send_keys("skypro2023")
time.sleep(5)
enter_btn = driver.find_element(By.ID, 'gradient-blue')

# Проверка нажатия чек-бокса "Запомнить меня"
remember_btn = driver.find_element(By.ID, 'user_auth_remember')
remember_btn.click()
time.sleep(5)

# Вход
enter_btn.click()
time.sleep(5)