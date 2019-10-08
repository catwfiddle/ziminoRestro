/*The tip the customber enters gets inserted into the ordered table.
The view is used to hide the tip that is in the ordered table.*/

use zimino;
create view tips_view as 
select tip 
from ordered; 

use zimino; 
insert into menu
(menu_id, customer_id, description_drink, 
description_appetizers, description_main_course, description_dessert)
VALUES  
(1, 1, 'Italian soda', 'Calamari Fritti', 'Spaghetti Al Salmone', 'Chocolate cake'), 
(2, 2, 'Coke', 'Carpaccio di salmone', 'Fettuccine ai Gamberoni', 'Cheesecake'),
(3, 3, 'Diet Coke', 'Bruschetta', 'Linguine con Gamberetti', 'Tiramisu'),
(4, 4, 'Sprite', 'Salad','Ravioli alla Aragosta', null), 
(5, 5, 'Fanta', 'Panzerotti', 'Linguine Di Granchio', null),
(6, 6, 'Coffee', null, 'Spiedini di polpettine', null),
(7, 7, 'Wine', null, 'Vegetariana', null), 
(8, 8, null, null, 'Fradiavola', null);



