## Spring Boot Rest API project

### Task: 
Написать Spring Boot приложение на Java 8, реализующее REST API, которые позволяют осуществлять
CRUD операции над каталогом товаров, а также поиск по нему.

Данные о товаре должны содержать его наименование, описание (примечание) и категорию товара
(один товар может относиться к нескольким категориям). Предполагается, что взаимодействие с БД
будет реализовано с использованием JPA (Hibernate или EclipseLink).

Поиск должен быть сделан с помощью JPA Criteria API, при этом должны поддерживаться поиск по
категории, поиск по части названия. Выбор БД за исполнителем (желательно PostgreSQL, но можно и
другую open source).

Результат: исходный код приложения с инструкциями по развертыванию (можно ссылку на GitHub)

### Инструкция по развертыванию
  1.  Клонируем проект `git clone https://github.com/sskovalevskiy/roi-entry-task`
  2.  Загружаем дамп базы данных для MySQL 5.7 из папки: [roi-entry-task\src\main\resources\database.sql](roi-entry-task\src\main\resources\database.sql)
  3.  При использовании нестандартных логина/пароля для доступа к БД необходимо в файле ***application.properties***
изменить значения полей ***spring.datasource.username=root*** и ***spring.datasource.password=root*** на актуальные.
  4.  Переходим в корень проекта `cd roi-entry-task`
  5.  Запускаем сервер `mvn spring-boot:run`


### Получение JSON от сервера
Чтобы получить полный список всех продуктов необходимо в адресной строке браузера обратиться по адресу
[localhost:8080/products](http://localhost:8080/products)

Для получения списка продуктов относящихся к определенной категории необходимо в адресной строке сформировать запрос вида 
[localhost:8080/products?category=name](http://localhost:8080/products?category=name), name указывается с учётом регистра.

Для поиска товаров название которых содержит некий текст необходимо в адресной строке отправить запрос вида
[localhost:8080/products?title=text](http://localhost:8080/products?title=text), где text - часть названия искомого товара с учётом регистра

Проверить возможность добавления, редактирования и удаления записей в базе данных можно воспользовавшись средствами разработчика
в браузере: Ctrl+Shift+I либо F12 в Google Chrome. Для этого во вкладке Console необходимо сформировать и отправить запрос сходный с одним из следующих:
 * для операции добавления в таблицу  
```fetch('/products', {method:'POST', headers:{'Content-Type':'application/json'}, body: JSON.stringify({title: 'Yandex', description:'Lorem ipsum dolor si amet...'})}).then(result => console.log(result))```

* для операции редактирования данных в таблице  
```fetch('/products/3', {method:'PUT', headers:{'Content-Type':'application/json'}, body: JSON.stringify({title: 'Yahoo', description:'Lorem ipsum dolor si amet...'})}).then(result => console.log(result))```

* для удаления продукта из таблицы  
```fetch('/products/2', {method:'DELETE'}).then(result => console.log(result))```
