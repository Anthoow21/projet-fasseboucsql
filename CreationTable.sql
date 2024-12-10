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
  
  utilisateurConnecte BOOLEAN;
  loginUtilisateurConnecte VARCHAR;
  
END PackFasseBouc;
/

set SERVEROUTPUT on

CREATE OR REPLACE PACKAGE BODY PackFasseBouc IS
  
  PROCEDURE ajouterUtilisateur(loginUtilisateurVar in varchar) IS
    BEGIN
      INSERT INTO utilisateur VALUES (loginUtilisateurVar);
      EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
          dbms_output.put_line('Erreur : utilisateur déjà existant dans la BDD.');
        WHEN OTHERS THEN
          dbms_output.put_line('SQLCODE : '||SQLCODE);
          dbms_output.put_line('SQLERRM : '||SQLERRM);
    END;
  
  PROCEDURE connexionUtilisateur(loginUtilisateurVar in varchar) IS
    BEGIN
      IF loginUtilisateurVar IS NULL THEN    
        loginUtilisateurConnecte := loginUtilisateurVar;
        utilisateurConnecte := TRUE;
      ELSE 
        dbms_output.put_line('Erreur : utilisateur déjà connecté');
      END IF;
    END;
  
  PROCEDURE deconnexion IS
    BEGIN
      loginUtilisateurConnecte := NULL;
      utilisateurConnecte := FALSE;
    END;
  
  PROCEDURE supprimerUtilisateur IS
    BEGIN
      DELETE FROM UTILISATEUR WHERE loginUtilisateur = loginUtilisateurConnecte;
    END;
  
  PROCEDURE ajouterAmi(loginAmiVar in varchar) IS
    BEGIN
      INSERT INTO LIER VALUES (loginUtilisateurConnecte, loginAmiVar);
    END;
    
  PROCEDURE supprimerAmi(loginAmiVar in varchar) IS
    BEGIN
      DELETE FROM LIER WHERE (LIER.loginUtilisateur = loginUtilisateurConnecte
              AND LIER.loginAmiVar = loginAmiVar) OR (LIER.loginAmiVar = loginUtilisateurConnecte
              AND LIER.loginUtilisateur = loginAmiVar);
    END;
    
  PROCEDURE afficherMur(loginUtilisateurVar in varchar) IS
    BEGIN
        SELECT Contenu FROM MESSAGE WHERE loginDestinataire = loginUtilisateurVar;
    END;
  
  PROCEDURE ajouterMessageMur(loginAmiVar in varchar, message in varchar) IS
    BEGIN
      IF loginAmiVar IS NULL THEN
        INSERT INTO Message VALUES (message, SYSDATE, loginUtilisateurConnecte, NULL, loginUtilisateurConnecte);
      ELSE
        INSERT INTO Message VALUES (message, SYSDATE, loginUtilisateurConnecte, NULL, loginAmiVar);
      END IF;
    END;
    
  PROCEDURE supprimerMessageMur(id_messageVar in number) IS
    BEGIN
      DELETE FROM MESSAGE WHERE MESSAGE.ID_MESSAGE = id_messageVar;
    END;
    
  PROCEDURE repondreMessageMur(id_messageVar in number, messageReponse in varchar) IS
    BEGIN
      
    END;
    
  PROCEDURE afficherAmi(loginUtilisateurVar in varchar) IS
    BEGIN
      SELECT L.loginUtilisateur, L.loginAmi 
      FROM LIER L
      WHERE loginUtilisateurVar = L.loginUtilisateur OR loginUtilisateurVar = L.loginAmi;
    END;
    
  PROCEDURE compterAmi(loginUtilisateurVar in varchar) IS
    BEGIN
      SELECT COUNT(*) AS NombreAmi
      FROM LIER L
      WHERE loginUtilisateurVar = L.loginUtilisateur OR loginUtilisateurVar = L.loginAmi;
    END;
    
  PROCEDURE chercherMembre(prefixLoginMembre in varchar) IS
    BEGIN
      SELECT loginUtilisateurConnecte FROM utilisateur WHERE loginUtilisateurConnecte LIKE CONCAT (prefixLoginMembre,'%');
    END;
      
      
  FUNCTION testerAmi (loginUtilisateurVar in varchar, 
  
END PackFasseBouc;
/
