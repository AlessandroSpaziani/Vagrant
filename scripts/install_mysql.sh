#!/bin/bash

FILE_PATH="/etc/mysql/my.cnf"
LINE_TO_MODIFY="bind-address = 127.0.0.1"
NEW_LINE="bind-address = 0.0.0.0"
DB_NAME="databaseVagrant"

# update packages
sudo apt update -y

# install mysql server
sudo apt-get install -y mysql-server

sudo tee -a /etc/mysql/mysql.conf.d/mysqld.cnf <<EOF
  [mysqld]
  bind-address = 10.10.20.11
EOF

# Crea un utente e un database
sudo mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
sudo mysql -e "CREATE USER 'User'@'10.10.20.10' IDENTIFIED BY 'Password&1'";
sudo mysql -e "GRANT ALL PRIVILEGES ON databaseVagrant.* TO 'User'@'10.10.20.10' WITH GRANT OPTION";
sudo mysql -uroot -e "USE $DB_NAME; FLUSH PRIVILEGES;"
sudo mysql -uroot -e "USE $DB_NAME; CREATE TABLE IF NOT EXISTS persona (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    cognome VARCHAR(50),
    data_di_nascita DATE,
    indirizzo VARCHAR(100),
    email VARCHAR(100)
);"
sudo mysql -uroot -e "USE $DB_NAME; INSERT INTO persona (nome, cognome, data_di_nascita, indirizzo, email) VALUES
    ('Mario', 'Rossi', '1990-01-01', 'Via Roma 1', 'mario.rossi@example.com'),
    ('Luca', 'Bianchi', '1985-02-15', 'Via Milano 2', 'luca.bianchi@example.com'),
    ('Giulia', 'Verdi', '1992-05-10', 'Via Napoli 3', 'giulia.verdi@example.com'),
    ('Laura', 'Gialli', '1988-07-20', 'Via Firenze 4', 'laura.gialli@example.com'),
    ('Alessio', 'Neri', '1995-03-12', 'Via Venezia 5', 'alessio.neri@example.com'),
    ('Francesca', 'Russo', '1994-09-23', 'Via Torino 6', 'francesca.russo@example.com'),
    ('Simone', 'Romano', '1986-11-05', 'Via Bologna 7', 'simone.romano@example.com'),
    ('Valentina', 'Conti', '1991-08-17', 'Via Genova 8', 'valentina.conti@example.com'),
    ('Marco', 'Ferrari', '1987-04-25', 'Via Palermo 9', 'marco.ferrari@example.com'),
    ('Giuseppe', 'Martini', '1993-06-06', 'Via Catania 10', 'giuseppe.martini@example.com'),
    ('Sara', 'Leone', '1990-10-30', 'Via Verona 11', 'sara.leone@example.com'),
    ('Stefano', 'Santoro', '1989-12-14', 'Via Trieste 12', 'stefano.santoro@example.com'),
    ('Federica', 'Greco', '1996-02-08', 'Via Salerno 13', 'federica.greco@example.com'),
    ('Antonio', 'Rizzo', '1988-07-01', 'Via Pisa 14', 'antonio.rizzo@example.com'),
    ('Martina', 'Longo', '1995-09-27', 'Via Catanzaro 15', 'martina.longo@example.com');"


# Allow connections from every host
#sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
#sudo sed -i "s/${LINE_TO_MODIFY}/${NEW_LINE}/" "${FILE_PATH}"


# restart mysql service
sudo systemctl restart mysql.service