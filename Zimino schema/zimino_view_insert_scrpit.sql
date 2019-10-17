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
description_appetizers, description_main_course, description_dessert)
VALUES  
(1, 'Italian soda', 'Calamari Fritti', 'Spaghetti Al Salmone', 'Chocolate cake'), 
(2, 'Coke', 'Carpaccio di salmone', 'Fettuccine ai Gamberoni', 'Cheesecake'),
(3, 'Diet Coke', 'Bruschetta', 'Linguine con Gamberetti', 'Tiramisu'),
(4, 'Sprite', 'Salad','Ravioli alla Aragosta', null),
(5, 'Fanta', 'Panzerotti', 'Linguine Di Granchio', null),
(6, 'Coffee', null, 'Spiedini di polpettine', null),
(7, 'Wine', null, 'Vegetariana', null), 
(8, 'Tea', null, 'Fradiavola', null);
