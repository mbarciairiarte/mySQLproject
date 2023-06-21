#Grupal 4
Create table Tlv_coins(
id_user int auto_increment,
cuenta varchar(50) not null,
saldo int not null check (saldo > 0),
primary key (id_user)
);

SELECT * FROM Tlv_coins;
insert into tlv_coins (cuenta,saldo) 
values ('A','1000'),
('B','1000'),
('C','1000'),
('D','1000');

-- Necesitamos transferir 200 TLV Coins desde un usuario A a un usuario B.
-- Para esto realice las siguientes transacciones.

start transaction; 
set autocommit =0;

# Transfiera 200 TLV Coins desde el usuario A el usuario B.
Update tlv_coins set saldo = resta_saldo(saldo,200) where cuenta = 'A' and saldo > 200;
Update tlv_coins set saldo = suma_saldo(saldo,200) where cuenta = 'B';

Select * from Tlv_coins;
-- Deshaga la transacción que realiza el usuario A al usuario usuario B.
rollback ;

# Transfiera 150 TLV Coins desde el usuario B al usuario C.
Update tlv_coins set saldo= resta_saldo(saldo,150) where cuenta = 'B' and saldo > 150;
Update tlv_coins set saldo= suma_saldo(saldo,150) where cuenta = 'C';

Select * from Tlv_coins;
-- Deshaga la transacción que realiza el usuario B al usuario usuario C.
rollback ;

# Transfiera 500 TLV Coins desde el usuario C al usuario D.
Update tlv_coins set saldo= resta_saldo(saldo,500) where cuenta = 'C' and saldo > 500;
Update tlv_coins set saldo= suma_saldo(saldo,500) where cuenta = 'D';
-- Realice un commit de la transacción que realiza el usuario C al usuario usuario D.
commit;
Select * from Tlv_coins;

# Transfiera 200 TLV Coins desde el usuario D al usuario A.
Update tlv_coins set saldo= resta_saldo(saldo,200) where cuenta = 'D' and saldo > 200;
Update tlv_coins set saldo= suma_saldo(saldo,200) where cuenta = 'A';
-- Realice un commit de la transacción que realiza el usuario D al usuario usuario A.
commit;
Select * from Tlv_coins;

set autocommit = 1;
Select * from Tlv_coins;