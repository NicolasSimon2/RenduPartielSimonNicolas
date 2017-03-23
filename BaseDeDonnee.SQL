DROP DATABASE IF EXISTS MLR3;

CREATE DATABASE IF NOT EXISTS MLR3;
USE MLR3;
# -----------------------------------------------------------------------------
#       TABLE : UTILISATEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS UTILISATEUR
 (
   ID_UTILISATEUR INTEGER NOT NULL  ,
   NOM_UTILISATEUR TEXT NULL  ,
   MOT_DE_PASSE TEXT NULL  ,
   EMAIL TEXT NULL  ,
   TELEPHONE TEXT NULL  
   , PRIMARY KEY (ID_UTILISATEUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CLIENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CLIENT
 (
   ID_CLIENT INTEGER NOT NULL  ,
   NOM_UTILISATEUR TEXT NULL  ,
   ADRESSE TEXT NULL  ,
   EMAIL TEXT NULL  ,
   TELEPHONE TEXT NULL  
   , PRIMARY KEY (ID_CLIENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : NOTE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS NOTE
 (
   ID_NOTE INTEGER NOT NULL  ,
   ID_UTILISATEUR INTEGER NOT NULL  ,
   ID_PROJET INTEGER NOT NULL  ,
   NOTE TEXT NULL  ,
   DATE_NOTE TEXT NULL  
   , PRIMARY KEY (ID_NOTE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE NOTE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_NOTE_UTILISATEUR
     ON NOTE (ID_UTILISATEUR ASC);

CREATE  INDEX I_FK_NOTE_PROJET
     ON NOTE (ID_PROJET ASC);

# -----------------------------------------------------------------------------
#       TABLE : PROJET
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PROJET
 (
   ID_PROJET INTEGER NOT NULL  ,
   ID_CLIENT INTEGER NOT NULL  ,
   NOM_PROJET TEXT NULL  ,
   NATURE_PROJET TEXT NULL  ,
   PLANIFICATION_PROJET TEXT NULL  ,
   RESSOURCE_PROJET TEXT NULL  
   , PRIMARY KEY (ID_PROJET) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PROJET
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PROJET_CLIENT
     ON PROJET (ID_CLIENT ASC);

# -----------------------------------------------------------------------------
#       TABLE : PARTICIPE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PARTICIPE
 (
   ID_PROJET INTEGER NOT NULL  ,
   ID_UTILISATEUR INTEGER NOT NULL  
   , PRIMARY KEY (ID_PROJET,ID_UTILISATEUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PARTICIPE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PARTICIPE_PROJET
     ON PARTICIPE (ID_PROJET ASC);

CREATE  INDEX I_FK_PARTICIPE_UTILISATEUR
     ON PARTICIPE (ID_UTILISATEUR ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE NOTE 
  ADD FOREIGN KEY FK_NOTE_UTILISATEUR (ID_UTILISATEUR)
      REFERENCES UTILISATEUR (ID_UTILISATEUR) ;


ALTER TABLE NOTE 
  ADD FOREIGN KEY FK_NOTE_PROJET (ID_PROJET)
      REFERENCES PROJET (ID_PROJET) ;


ALTER TABLE PROJET 
  ADD FOREIGN KEY FK_PROJET_CLIENT (ID_CLIENT)
      REFERENCES CLIENT (ID_CLIENT) ;


ALTER TABLE PARTICIPE 
  ADD FOREIGN KEY FK_PARTICIPE_PROJET (ID_PROJET)
      REFERENCES PROJET (ID_PROJET) ;


ALTER TABLE PARTICIPE 
  ADD FOREIGN KEY FK_PARTICIPE_UTILISATEUR (ID_UTILISATEUR)
      REFERENCES UTILISATEUR (ID_UTILISATEUR) ;

