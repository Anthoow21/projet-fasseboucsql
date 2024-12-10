--Comentaire pour le protype
/* ChercherMembre
-- Permet de chercher un utilisateur : 
-- préfixeLoginMembre est la formule de recherche
-- SELECT LoginUtilisateur FROM utilisateur WHERE LoginUtilisateur LIKE 
SELECT CONCAT (préfixeLoginMembre,'%')
-- 
*/

/*CompterAmi
--Permet de compter le nombre d'ami d'une personne : 
-- LoginUtilisateur est le profil au quel on veut faire la recherche.
--SELECT COUNT(LoginUtilisateur) WHERE
(	(	(SELECT * FROM Utilisateur)R1
	INNER JOIN
		(SELECT * FROM LIER)R2
	ON R1.LoginUtilisateur = R2.LoginUtilisateur)
UNION
	(	(SELECT * FROM utilisateur)R3
	INNER JOIN
		(SELECT * FROM LIER)R4
	ON R3.LoginUtilisateur=R4.LoginUtilisateur
);
*/

/*AfficherAmi
--Permet d'afficher la liste d'ami d'un utlisateur
-- LoginUtilisateur permet de sélectionner le profil au quel on fait la recherche
-- --SELECT COUNT(LoginUtilisateur) WHERE
(
	(SELECT	LoginUtilisateur1 FROM
		(
			(SELECT * FROM Utilisateur)R1
		INNER JOIN
			(SELECT * FROM LIER)R2
		ON R1.LoginUtilisateur = R2.LoginUtilisateur
		)
	)
	UNION
	(SELECT LoginUtilisateur FROM	
		(
			(SELECT * FROM utilisateur)R3
		INNER JOIN
			(SELECT * FROM LIER)R4
		ON R3.LoginUtilisateur=R4.LoginUtilisateur
		) 
	)
)
;

/*repondreMessage