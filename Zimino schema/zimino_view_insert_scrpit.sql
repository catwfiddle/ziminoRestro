/*The tip the customber enters gets inserted into the ordered table.
The view is used to hide the customer's tip that is in the ordered table.*/
use zimino;
create  view tips_view as 
select tip 
from ordered; 

/*This populates the menu table.*/
use zimino; 
insert into menu 
(menu_id, description_drink, 
description_appetizers, description_main_course, description_dessert, appetizers_infor, main_course_infor,  drink_price, appetizers_price, main_course_price, dessert_price)
VALUES  
(1, 'Italian soda', 'Calamari Fritti', 'Spaghetti Al Salmone', 'Chocolate cake', 'Fried calamari', 'Salmon Spaghetti in Alfredo sauce', '3', '15.95', '15.95', '4'), 
(2, 'Coke', 'Carpaccio di salmone', 'Fettuccine ai Gamberoni', 'Cheesecake', 'Thin slices of smoked salmon with lemon and oil', 'Prawns Fettuccine in Alfredo sauce', '1.50', ' 13.95', '16.25', '5'),
(3, 'Diet Coke', 'Bruschetta', 'Linguine con Gamberetti', 'Tiramisu', 'Fresh tomatoes with oil, garlic, and vinegar served on Italian bread', 'Shrimp Linguine in white wine sauce', '1.50', '8.95', '16.25', '5'),
(4, 'Sprite', 'Salad','Ravioli alla Aragosta', null, 'Greens, croutons, nuts, parmesan, Italian Vinaigrette dressing', 'Lobster ravioli in a red sauce', '1.50', '10.59', '16.95', null),
(5, 'Fanta', 'Panzerotti', 'Linguine Di Granchio', null, 'small tomato, ham, mozzarella calzone, deep fried', 'Crab linguine in a pink sauce',  '1.50', '8.95', '20.95', null),
(6, 'Coffee', null, 'Spiedini di polpettine', null, null, 'Spaghetti and meatballs with red sauce', '3', null, '11.95', null),
(7, 'Wine', null, 'Vegetariana', null, null, 'Pizza with mozzarella, eggplant, tomatoes, mushrooms', '5', null, '15.95', null), 
(8, 'Tea', null, 'Fradiavola', null, null, 'Pizza with Italian sausage, pepperoni, mushrooms, red onions', '3', null, '16.95', null);

