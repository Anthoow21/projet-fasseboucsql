CREATE OR REPLACE PACKAGE PackFasseBouc IS
  PROCEDURE ajouterUtilisateur(loginUtilisateur in varchar);
  PROCEDURE supprimerUtilisateur;
  PROCEDURE connexion(loginUtilisateur in varchar);
  PROCEDURE deconnexion;
  PROCEDURE ajouterAmi(loginAmi in varchar);
  PROCEDURE supprimerAmi(loginAmi in varchar);
  PROCEDURE afficherMur(loginUtilisateur in varchar);
  PROCEDURE ajouterMessageMur(loginAmi in varchar, message in varchar);
  PROCEDURE supprimerMessageMur(id_message in number);
  PROCEDURE repondreMessageMur(id_message in number, messageReponse in varchar);
  PROCEDURE afficherAmi(loginUtilisateur in varchar);
  PROCEDURE compterAmi(loginUtilisateur in varchar);
  PROCEDURE chercherMembre(prefixeLoginMembre in varchar);
  
  
END PackFasseBouc;
/

CREATE OR REPLACE PACKAGE BODY PackFasseBouc IS
  PROCEDURE ajouterUtilisateur(loginUtilisateur in varchar) IS
  BEGIN
    INSERT INTO utilisateur VALUES (loginUtilisateur);
  END;
END PackFasseBouc;
/