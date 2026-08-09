-- ============================================
-- Скрипт загрузки товаров для KarisBrook
-- Все строки с кириллицей экранированы префиксом N
-- Пути к изображениям приведены к виду с дефисами
-- ============================================

-- === КАТЕГОРИИ ===
INSERT INTO Categories (Name, Slug)
SELECT N'Поло', 'polo'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Поло');

INSERT INTO Categories (Name, Slug)
SELECT N'Свитера', 'sweater'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Свитера');

INSERT INTO Categories (Name, Slug)
SELECT N'Рубашки', 'shirts'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Рубашки');

INSERT INTO Categories (Name, Slug)
SELECT N'Куртки', 'jackets'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Куртки');

INSERT INTO Categories (Name, Slug)
SELECT N'Шорты', 'shorts'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Шорты');

INSERT INTO Categories (Name, Slug)
SELECT N'Футболки', 'tee'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Футболки');

INSERT INTO Categories (Name, Slug)
SELECT N'Платья', 'dresses'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Платья');

INSERT INTO Categories (Name, Slug)
SELECT N'Худи', 'hoodie'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Худи');

INSERT INTO Categories (Name, Slug)
SELECT N'Жилеты', 'vests'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Жилеты');

INSERT INTO Categories (Name, Slug)
SELECT N'Джинсы', 'jeans'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Джинсы');

INSERT INTO Categories (Name, Slug)
SELECT N'Брюки', 'trousers'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Брюки');

INSERT INTO Categories (Name, Slug)
SELECT N'Пальто', 'coat'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Пальто');

INSERT INTO Categories (Name, Slug)
SELECT N'Пиджаки', 'suit jacket'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Пиджаки');

INSERT INTO Categories (Name, Slug)
SELECT N'Топы', 'tops'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Топы');

INSERT INTO Categories (Name, Slug)
SELECT N'Блузки', 'blouses'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Блузки');

INSERT INTO Categories (Name, Slug)
SELECT N'Юбки', 'skirts'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Юбки');

INSERT INTO Categories (Name, Slug)
SELECT N'Нижнее бельё', 'underwear'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Нижнее бельё');

INSERT INTO Categories (Name, Slug)
SELECT N'Аксессуары', 'accessories'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Аксессуары');

INSERT INTO Categories (Name, Slug)
SELECT N'Обувь', 'shoes'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Обувь');

INSERT INTO Categories (Name, Slug)
SELECT N'Парфюмерия', 'parfum'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Парфюмерия');

-- === БРЕНДЫ ===
INSERT INTO Brands (Name, LogoPath)
SELECT N'Arthur Ashe', '/brand logo/1.png'
WHERE NOT EXISTS (SELECT 1 FROM Brands WHERE Name = N'Arthur Ashe');

INSERT INTO Brands (Name, LogoPath)
SELECT N'Rowing Blazers', '/brand logo/6.png'
WHERE NOT EXISTS (SELECT 1 FROM Brands WHERE Name = N'Rowing Blazers');

INSERT INTO Brands (Name, LogoPath)
SELECT N'Strellson', '/brand logo/10.png'
WHERE NOT EXISTS (SELECT 1 FROM Brands WHERE Name = N'Strellson');

INSERT INTO Brands (Name, LogoPath)
SELECT N'Gant', '/brand logo/11.png'
WHERE NOT EXISTS (SELECT 1 FROM Brands WHERE Name = N'Gant');

INSERT INTO Brands (Name, LogoPath)
SELECT N'D.Molina', '/brand logo/7.png'
WHERE NOT EXISTS (SELECT 1 FROM Brands WHERE Name = N'D.Molina');

INSERT INTO Brands (Name, LogoPath)
SELECT N'Lindbergh', '/brand logo/12.png'
WHERE NOT EXISTS (SELECT 1 FROM Brands WHERE Name = N'Lindbergh');

INSERT INTO Brands (Name, LogoPath)
SELECT N'Benchgrade', '/brand logo/13.png'
WHERE NOT EXISTS (SELECT 1 FROM Brands WHERE Name = N'Benchgrade');

INSERT INTO Brands (Name, LogoPath)
SELECT N'Jardin de France', '/brand logo/14.png'
WHERE NOT EXISTS (SELECT 1 FROM Brands WHERE Name = N'Jardin de France');

INSERT INTO Brands (Name, LogoPath)
SELECT N'Knox', '/brand logo/15.png'
WHERE NOT EXISTS (SELECT 1 FROM Brands WHERE Name = N'Knox');

INSERT INTO Brands (Name, LogoPath)
SELECT N'Yankees', '/brand logo/16.png'
WHERE NOT EXISTS (SELECT 1 FROM Brands WHERE Name = N'Yankees');

INSERT INTO Brands (Name, LogoPath)
SELECT N'Brawl Stars', '/brand logo/5.png'
WHERE NOT EXISTS (SELECT 1 FROM Brands WHERE Name = N'Brawl Stars');

INSERT INTO Brands (Name, LogoPath)
SELECT N'Construe', '/brand logo/8.png'
WHERE NOT EXISTS (SELECT 1 FROM Brands WHERE Name = N'Construe');

-- === ТОВАРЫ ===
INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'ПОЛО ASHE RACQUETS',
    N'Топ-поло для тенниса с жаккардовым рисунком из смеси хлопка и вискозы ''Птичий глаз''',
    5200,
    NULL,
    '/product/1-1.jpg',
    4.5,
    1,
    0,
    (SELECT Id FROM Categories WHERE Name = N'Поло'),
    (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'ПОЛО ASHE RACQUETS' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe') AND ImagePath = '/product/1-1.jpg');

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'СВИТЕР ARTHUR ASHE',
    N'Хлопковый свитер с высоким воротом и вышитым значком Артура Эша на левой стороне груди.',
    5400,
    NULL,
    '/product/2-1.jpg',
    5.0,
    1,
    0,
    (SELECT Id FROM Categories WHERE Name = N'Свитера'),
    (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'СВИТЕР ARTHUR ASHE' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'ЖИЛЕТ-СВИТЕР ASHE PAISLEY',
    N'Хлопковый свитер-жилет из жаккардовой ткани с рисунком птичьего полета 12-го калибра с оригинальным рисунком пейсли в теннисном стиле',
    4500,
    6000,
    '/product/3-1.jpg',
    4.5,
    1,
    1,
    (SELECT Id FROM Categories WHERE Name = N'Жилеты'),
    (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'ЖИЛЕТ-СВИТЕР ASHE PAISLEY' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'КЕПКА ASHE SPORT',
    N'Кепка для папы из хлопкового твила с вышитым логотипом Ashe Sport, вдохновленным альма-матер Эша.',
    400,
    NULL,
    '/product/5-1.jpg',
    5.0,
    1,
    0,
    (SELECT Id FROM Categories WHERE Name = N'Аксессуары'),
    (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'КЕПКА ASHE SPORT' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'ПОЛО ASHE RACQUETS (Icon)',
    N'Шорты из вискозы с принтом, напоминающим шелк, с оригинальным узором пейсли в теннисном стиле',
    3000,
    4000,
    '/product/6-1.jpg',
    4.5,
    1,
    1,
    (SELECT Id FROM Categories WHERE Name = N'Поло'),
    (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'ПОЛО ASHE RACQUETS (Icon)' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'РУБАШКА ASHE PAISLEY',
    N'Рубашка на пуговицах из вискозы с принтом под шелк, оригинальным узором пейсли в теннисном стиле, классическим походным воротником и карманом на левой груди.',
    5000,
    NULL,
    '/product/7-1.jpg',
    3.5,
    1,
    0,
    (SELECT Id FROM Categories WHERE Name = N'Рубашки'),
    (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'РУБАШКА ASHE PAISLEY' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'ШОРТЫ ASHE PAISLEY',
    N'Шорты из вискозы с принтом, напоминающим шелк, с оригинальным узором пейсли в теннисном стиле',
    900,
    1000,
    '/product/8-1.jpg',
    4.5,
    1,
    1,
    (SELECT Id FROM Categories WHERE Name = N'Шорты'),
    (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'ШОРТЫ ASHE PAISLEY' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'ПОЛО ASHE RACQUETS (Shorts)',
    N'Спортивные шорты из полиэстера, окрашенного в пряже, с внутренним швом шириной 3,5 дюйма в ретро-стиле',
    5200,
    NULL,
    '/product/9-1.jpg',
    4.5,
    1,
    0,
    (SELECT Id FROM Categories WHERE Name = N'Шорты'),
    (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'ПОЛО ASHE RACQUETS (Shorts)' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'ТЕННИСНОЕ ПЛАТЬЕ ASHE ARTHUR',
    N'Женское теннисное платье с плиссированной юбкой, ребристым поясом и вырезами на рукавах',
    3000,
    4000,
    '/product/10-1.jpg',
    4.5,
    1,
    1,
    (SELECT Id FROM Categories WHERE Name = N'Платья'),
    (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'ТЕННИСНОЕ ПЛАТЬЕ ASHE ARTHUR' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'ПОЛО ASHE RACQUETS (Gingham)',
    N'Спортивные шорты из полиэстера, окрашенного в пряже, с внутренним швом шириной 3,5 дюйма в ретро-стиле.',
    5200,
    NULL,
    '/product/11-1.jpg',
    4.5,
    1,
    0,
    (SELECT Id FROM Categories WHERE Name = N'Шорты'),
    (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'ПОЛО ASHE RACQUETS (Gingham)' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'ТОЛСТОВКА ASHE ARTHUR',
    N'Хлопковая толстовка с капюшоном из французского махрового хлопка с вышитым логотипом Ashe Sport, вдохновленным alma mater Ashe.',
    3600,
    4500,
    '/product/12-1.jpg',
    5.0,
    1,
    1,
    (SELECT Id FROM Categories WHERE Name = N'Худи'),
    (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'ТОЛСТОВКА ASHE ARTHUR' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Arthur Ashe'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'РУБАШКА INDIAN MADRAS CAMP',
    N'Рубашка с коротким рукавом из индийского хлопка madras с классическим воротником на пуговицах.',
    6000,
    NULL,
    '/product/13-1.jpg',
    4.0,
    1,
    0,
    (SELECT Id FROM Categories WHERE Name = N'Рубашки'),
    (SELECT Id FROM Brands WHERE Name = N'Rowing Blazers')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'РУБАШКА INDIAN MADRAS CAMP' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Rowing Blazers'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'КЕПКА YANKEES',
    N'Кепка для папы с вышитым логотипом Yankees.',
    5400,
    NULL,
    '/product/15-1.jpg',
    4.5,
    1,
    0,
    (SELECT Id FROM Categories WHERE Name = N'Аксессуары'),
    (SELECT Id FROM Brands WHERE Name = N'Yankees')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'КЕПКА YANKEES' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Yankees'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'КУРТКА ROWING BLAZERS',
    N'Эта куртка, вдохновленная 90-ми годами, взята прямо из архива Jams, украшена нашивками совместного бренда и воплощает дух манифеста Jams: цвет, свобода, любовь. разработанный в партнерстве с The Courts в Палм-Спрингс, Калифорния.',
    4500,
    6000,
    '/product/16-1.jpg',
    4.5,
    1,
    1,
    (SELECT Id FROM Categories WHERE Name = N'Куртки'),
    (SELECT Id FROM Brands WHERE Name = N'Rowing Blazers')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'КУРТКА ROWING BLAZERS' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Rowing Blazers'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'ПЛЯЖНЫЕ БРЮКИ ROWING BLAZERS',
    N'Пляжные брюки из вискозы с принтом американского производства, на основе архивного дизайна Jams.',
    4500,
    6000,
    '/product/18-1.jpg',
    4.5,
    1,
    1,
    (SELECT Id FROM Categories WHERE Name = N'Брюки'),
    (SELECT Id FROM Brands WHERE Name = N'Rowing Blazers')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'ПЛЯЖНЫЕ БРЮКИ ROWING BLAZERS' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Rowing Blazers'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'НЕЙЛОНОВАЯ СУМКА ROWING BLAZERS',
    N'Это сумка вдохновленное 90-ми годами, прямо из архива Jams, с совместными нашивками и духом, воплощающим манифест Jams: Цвет, Свобода, Любовь.',
    3000,
    4000,
    '/product/20-1.jpg',
    3.0,
    1,
    1,
    (SELECT Id FROM Categories WHERE Name = N'Аксессуары'),
    (SELECT Id FROM Brands WHERE Name = N'Rowing Blazers')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'НЕЙЛОНОВАЯ СУМКА ROWING BLAZERS' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Rowing Blazers'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'BENCHGRADE CAPTOE BALMORAL',
    N'Дизайн Captoe balmoral - самый консервативный и универсальный стиль обуви. Подходит для собеседования при приеме на работу, свадьбы и любого другого случая.',
    4500,
    6000,
    '/product/21-1.jpg',
    4.5,
    1,
    1,
    (SELECT Id FROM Categories WHERE Name = N'Обувь'),
    (SELECT Id FROM Brands WHERE Name = N'Benchgrade')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'BENCHGRADE CAPTOE BALMORAL' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Benchgrade'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'AME DE THE VERT',
    N'Ame de Thé Vert (душа зеленого чая) - зеленый ароматический одеколон для мужчин и женщин.',
    5400,
    NULL,
    '/product/22-1.jpg',
    4.5,
    1,
    0,
    (SELECT Id FROM Categories WHERE Name = N'Парфюмерия'),
    (SELECT Id FROM Brands WHERE Name = N'Jardin de France')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'AME DE THE VERT' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Jardin de France'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'СОЛНЦЕЗАШИТНЫЕ ОЧКИ KNOX',
    N'Поляризованные линзы Mazzucchelli CR-39 со 100%-ной защитой от ультрафиолета.',
    900,
    1000,
    '/product/24-1.jpg',
    4.5,
    1,
    1,
    (SELECT Id FROM Categories WHERE Name = N'Аксессуары'),
    (SELECT Id FROM Brands WHERE Name = N'Knox')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'СОЛНЦЕЗАШИТНЫЕ ОЧКИ KNOX' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Knox'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'ХУДИ D.MOLINA',
    N'Уютное худи от бренда D.Molina.',
    4000,
    NULL,
    '/product/25-1.jpg',
    5.0,
    1,
    0,
    (SELECT Id FROM Categories WHERE Name = N'Худи'),
    (SELECT Id FROM Brands WHERE Name = N'D.Molina')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'ХУДИ D.MOLINA' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'D.Molina'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'КУРТКА LINDBERGH',
    N'Элегантная куртка от Lindbergh.',
    6000,
    NULL,
    '/product/26-1.jpg',
    5.0,
    1,
    0,
    (SELECT Id FROM Categories WHERE Name = N'Куртки'),
    (SELECT Id FROM Brands WHERE Name = N'Lindbergh')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'КУРТКА LINDBERGH' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Lindbergh'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'ФУТБОЛКА STRELLSON',
    N'Стильная футболка от Strellson.',
    4500,
    NULL,
    '/product/27-1.jpg',
    5.0,
    1,
    0,
    (SELECT Id FROM Categories WHERE Name = N'Футболки'),
    (SELECT Id FROM Brands WHERE Name = N'Strellson')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'ФУТБОЛКА STRELLSON' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Strellson'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'ФУТБОЛКА GANT',
    N'Классическая футболка от Gant.',
    4000,
    NULL,
    '/product/28-1.jpg',
    5.0,
    1,
    0,
    (SELECT Id FROM Categories WHERE Name = N'Футболки'),
    (SELECT Id FROM Brands WHERE Name = N'Gant')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'ФУТБОЛКА GANT' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Gant'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'ФУТБОЛКА BRAWL STARS',
    N'Футболка с принтом Brawl Stars.',
    4000,
    NULL,
    '/product/29-1.jpg',
    5.0,
    1,
    0,
    (SELECT Id FROM Categories WHERE Name = N'Футболки'),
    (SELECT Id FROM Brands WHERE Name = N'Brawl Stars')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'ФУТБОЛКА BRAWL STARS' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Brawl Stars'));

INSERT INTO Products (Name, Description, Price, OldPrice, ImagePath, Rating, IsNew, IsSale, CategoryId, BrandId)
SELECT 
    N'ФУТБОЛКА CONSTRUE',
    N'Модная футболка от Construe.',
    4000,
    NULL,
    '/product/30-1.jpg',
    5.0,
    1,
    0,
    (SELECT Id FROM Categories WHERE Name = N'Футболки'),
    (SELECT Id FROM Brands WHERE Name = N'Construe')
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE Name = N'ФУТБОЛКА CONSTRUE' AND BrandId = (SELECT Id FROM Brands WHERE Name = N'Construe'));